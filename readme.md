
# RingerTuning framework

This framework release contains packages needed to tune the Ringer algorithm.

Other available releases:

- [RingerProject](https://github.com/wsfreund/RingerProject): The full framework, containing all available packages for tuning and analysing the algorithm.

Table of Contents
=================

  * [RingerTuning framework](#ringertuning-framework)
  * [Installation](#installation)
    * [Prerequisities on Ubuntu](#prerequisities-on-ubuntu)
    * [ Prerequisities on MacOS](#prerequisities-on-macos)
    * [Alternative when no root binary is available](#alternative-when-no-root-binary-is-available)
    * [Compilation procedure](#compilation-procedure)
  * [Usage](#usage)
    * [Update to the last stable version](#update-to-the-last-stable-version)
  * [Release organization overview](#release-organization-overview)


# Installation


In order to install the RingerProject packages, it is needed to compile the source codes and prepare the environment to the next usage setups. All RingerProject tools are available on CVMFS, however, it is possible to compile the packages without access to CVMFS as described in the ahead topics. Basically, the following tools need to be available on the OS if no CVMFS is available (in most cases, CVMFS access is only available to CERN computers):

- CERN root framework: choose one recent stable release;
- python2: make sure to have at least one recent 2.7 python available;
- C compiler (clang/gcc): make sure to have one recent C++ compiler;
- git/subversion: The git provides an easy way to obtain the packages and keep the release update. The subversion is a dependency for RootCore and therefore it is needed by the release.

The following sections describe how to obtain those packages for different OS when no CVFMS is available. Afterwards, the compilation procedure is described and should be followed by all cases after the prerequisites are answered.

## Prerequisities on Ubuntu

Download the root binaries for your Ubuntu from https://root.cern.ch/downloading-root if your ubuntu version has the binaries available. If no version is available for your Ubuntu, for instance, the only version available when this document was written was for Ubuntu14, you will need to compile root as specified [here](https://github.com/joaoVictorPinto/RingerProject/blob/master). The last release available during when this documentation was written is [6.06](https://root.cern.ch/download/root_v6.06.02.Linux-ubuntu14-x86_64-gcc4.8.tar.gz). Untar it and move to your home and add to your bashrc (assuming bash is being used):

```
tar xfvz ~/Downloads/root_*ubuntu*tar.gz -C $HOME
echo 'source $HOME/root/bin/thisroot.sh' >> ~/.bashrc
source $HOME/root/bin/thisroot.sh
```

Then use apt-get to install other dependencies (steps marked with recommended are not obligatory):

```
# Install gcc and other developer tools
sudo apt-get install coreutils
# Install python
sudo apt-get install python
# Install needed CVS
sudo apt-get install git subversion
# (Recommended) Install numpy and scipy
sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
# (Recommended) Install boost
sudo apt-get install libboost-all-dev
```

## Prerequisities on MacOS

First, we install the needed basis:

```
# Install Command Line Developer Tools (for clang and cvs)
xcode-select --install
# Install brew or ports
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install gnu core utils (dependency on readlink), and also wget (which may be replaced by curl in the future):
brew install coreutils
brew install wget
# We will also need the python developer so that we can link with it:
brew install python
# Add to your path and manpath the core utils (change profile to bashrc or zshrc in case you use a custom shell setup)
echo 'PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> .profile
echo 'MANPATH=\"/usr/local/opt/coreutils/libexec/gnuman\$MANPATH"' >> .profile
source .profile
```

Then, we install the root with a similar procedure from the one used for the Ubuntu OS, where we download the binaries for the current MacOS version that we are using. In this case we were using El Capitan with native clang:

```
curl -L -o root.tgz https://root.cern.ch/download/root_v6.04.16.macosx64-10.11-clang70.tar.gz
tar xfvz root.tgz -C $HOME
echo 'source $HOME/root/bin/thisroot.sh' >> ~/.profile
source $HOME/root/bin/thisroot.sh
rm root.tgz
# In this case, the root binaries were linked to XCode itself, so it was needed to install XCode from App Store.
```

## Alternative when no root binary is available

This procedure is to be followed if no binary version is available for your OS, more details available [here](https://root.cern.ch/installing-root-source):

```
# We will use cmake, so we use brew to add it to our system
brew install cmake
git clone http://root.cern.ch/git/root.git ~/root
cd ~/root
# list tag
git tag
# choose one of the above tags, i.e.:
git checkout v6-04-12
configure
make
```


## Compilation procedure

First retrieve the release:

```
git clone https://github.com/wsfreund/RingerTuning.git
cd RingerTuning
```

Download source content (read RootCoreMacros `setup_modules.sh` [documentation](https://github.com/wsfreund/RootCoreMacros#setup_modulessh) for more details):

```
./setup_modules.sh
```

And, finally, compile RootCore packages on this release (cf. RootCoreMacros `buildthis.sh` [documentation](https://github.com/wsfreund/RootCoreMacros#buildthissh) for more information):

```
source buildthis.sh
source buildthis.sh
```

# Usage

In each session that you want to have access to the framework functionalities, it is needed to run the following command (read RootCoreMacros `setrootcore.sh` [documentation](https://github.com/wsfreund/RootCoreMacros#setrootcoresh) for more details):  

```
source setrootcore.sh
```

For more information on how each package work, take a look on each package documentation. An overview of the packages available is [documented here](#Release-organization-overview).


## Update to the last stable version

In order to keep the package updated, run the following commands:

```
git pull origin master
./setup_modules.sh
```

and recompile the release:

```
source buildthis.sh --clean-env --dist-clean --no-build
# Open new fresh shell
source buildthis.sh
```


# Release organization overview

The following packages are available in this release:

- [`RingerCore`](https://github.com/wsfreund/RingerCore) (RingerCore package): Package containing base functionalities for the framework;
- [`RootCoreMacros`](https://github.com/wsfreund/RootCoreMacros) (RootCoreMacros package): Provides RootCore unofficial scripts for improving user interaction with the framework;
- [`TuningTools`](https://github.com/wsfreund/TuningTools) (TuningTools package): All sort of tools for tuning the algorithm;


<script type="text/javascript">
    show=true;
    function toggle(){
        if (show){
            $('div.input').hide();
        }else{
            $('div.input').show();
        }
        show = !show
    }
$.getScript('https://kmahelona.github.io/ipython_notebook_goodies/ipython_notebook_toc.js')
</script>
<a href="javascript:toggle()" target="_self"></a>
