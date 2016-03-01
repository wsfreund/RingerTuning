#!/bin/bash

show_help() {
cat << EOF
Usage: ${0##*/} [--dev] [--head]

Initialize current master module and get child modules on their respective commits
determined by the master module release.

    -h                display this help and return
    -d|--dev          If set to true, then retrieve commited packages with 
                      your ssh git push rights. Of course, this assumes that
                      your git account has the rights to do so, otherwise it
                      will fail. 
   -H|--head          It will update to the submodules head instead of the used
                      commit versions stablished to be used by the packge.
EOF
}

mainmodule() {       
  currentPath=$PWD
  mainModule=$currentPath
  while true; do
    cd "$(git rev-parse --show-toplevel)/.."
    if $(git rev-parse --is-inside-work-tree > /dev/null 2> /dev/null); then
      mainModule=$PWD
      #echo $mainModule  >&2
    else
      break
    fi
  done
  cd $currentPath
  echo $mainModule
}

# The default values:
dev=0
head=0

while :; do
  case $1 in
    -h|-\?|--help)   # Call a "show_help" function to display a synopsis, then exit.
      show_help
      return
      ;;
    --dev)
      if [ ${2#--} != $2 ]; then
        dev=1
      else
        dev=$2
        shift 2
        continue
      fi
      ;;
    -d=?*|--dev=?*)
      dev=${1#*=} # Delete everything up to "=" and assign the remainder.
      ;;
    -d=|--dev=)   # Handle the case of an empty --dev=
      echo 'ERROR: "--dev" requires a non-empty option argument.\n' >&2
      return 1
      ;;
    --head)
      if [ ${2#--} != $2 ]; then
        head=1
      else
        head=$2
        shift 2
        continue
      fi
      ;;
    -H=?*|--head=?*)
      head=${1#*=} # Delete everything up to "=" and assign the remainder.
      ;;
    -H=|--head=)   # Handle the case of an empty --head=
      echo 'ERROR: "--head" requires a non-empty option argument.\n' >&2
      return 1
      ;;
    --)              # End of all options.
      shift
      break
      ;;
    -?*)
      echo 'WARN: Unknown option (ignored): %s\n' "$1" >&2
      ;;
    *)               # Default case: If no more options then break out of the loop.
      break
  esac
  shift
done

git pull

git submodule init
if test "$dev" -eq "1"; then
  moduleFile=$(mainmodule)/.gitmodules
  sed -i.bak "s_\(\S*url = \)https://github.com/\(.*\)_\1git@github.com:\2_" $moduleFile
fi

git submodule sync

if test "$head" -eq "0"; then
  git submodule update --recursive
else # head
  if ! git pull --recurse-submodules
  then
    git submodule foreach --recursive checkout master
    git submodule foreach --recursive git pull origin master
  fi
fi

true
