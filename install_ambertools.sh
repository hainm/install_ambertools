#!/bin/sh

# conda install:
url='https://122-81537431-gh.circle-artifacts.com/0/tmp/circle-artifacts.Rk0JNO6/ambertools-build/amber-conda-bld/linux-64/ambertools-17.0-0.tar.bz2'
wget $url
conda install ambertools-17.0-0.tar.bz2

# non conda-install:
#    pick your favorite python version
#    url='https://124-81537431-gh.circle-artifacts.com/0/tmp/circle-artifacts.ejmiCgE/ambertools-build/amber-conda-bld/non-conda-install/linux-64.ambertools-17.0-0.28Feb17.H0613.tar.bz2''
#    tar -xf linux-64.ambertools-17.0-0.28Feb17.H0613.tar.bz2
#    source amber17/amber.sh
