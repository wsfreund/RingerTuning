
# RingerTuning framework

This framework release contains packages needed to tune the Ringer algorithm.

Other available release of the framework is:

- [RingerProject](https://github.com/wsfreund/RingerProject): The full framework, containing all available packages for tuning and analysing the algorithm.

Table of Contents
=================

  * [RingerTuning framework](#ringertuning-framework)
  * [Installation](#installation)
  * [Usage](#usage)
    * [Update to the last stable version](#update-to-the-last-stable-version)
  * [Release organization overview](#release-organization-overview)


# Installation

First retrieve the release:

```
git clone https://github.com/wsfreund/RingerTuning.git
cd RingerTuning
```

Download source content (read [RootCoreMacros `setup_modules.sh` documentation](https://github.com/wsfreund/RootCoreMacros#setup_modulessh) for more details):

```
./setup_modules.sh
```

And, finally, compile RootCore packages on this release (cf. [RootCoreMacros `buildthis.sh` documentation](https://github.com/wsfreund/RootCoreMacros#buildthissh) for more information):

```
source buildthis.sh
source buildthis.sh
```

# Usage

In each session that you want to have access to the framework functionalities, it is needed to run the following command (read [RootCoreMacros `setrootcore.sh` documentation](https://github.com/wsfreund/RootCoreMacros#setrootcoresh) for more details):  

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


