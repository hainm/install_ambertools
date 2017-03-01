#!/bin/sh

url='https://139-81537431-gh.circle-artifacts.com/0/tmp/circle-artifacts.0zkpNrQ/ambertools-build/amber-conda-bld/linux-64/ambertools-17.0-0.tar.bz2'
wget $url
conda install ambertools-17.0-0.tar.bz2

url2="http://ambermd.org/downloads/ambertools-dev/AmberTools17.tar.gz"
tarfile=`python -c "url='$url2'; print(url.split('/')[-1])"`

function download_ambertools(){
    wget $url2 -O $tarfile
    tar -xf $tarfile
}

download_ambertools

export AMBERHOME=`python -c "import sys; print(sys.prefix)"`
amber.setup_test_folders `pwd`/amber17
amber.run_tests
