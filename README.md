# py-pkg

Compilation and packaging tools for Python.

**Status:** The builds and package appear to work but little testing has been performed so far.

## Overview

Sometimes you need more that one version of python installed in production settings.

Maybe you're migrating from one version to another, or perhaps you have legacy code that you want to run using a specific version.

This project provides Linux OS packages (initiallu for Ubuntu and CentOS/RedHat) that install to `/opt/python/<version number>` so that multiple versions can be installed side-by-side.

The installation packages are called 'python\<version number\>' and the package version number is actually the build number.

Builds are run using a parameterised build where the version number(s) of the Python version(s) to be built are specified at build time. The build process takes care of downloading the Python source, compiling it and packaging it for release.
