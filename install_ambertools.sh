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

# install source code for testing
url2="http://ambermd.org/downloads/ambertools-dev/AmberTools17.tar.gz"
tarfile=`python -c "url='$url2'; print(url.split('/')[-1])"`

function download_ambertools(){
    wget $url -O $tarfile
    tar -xf $tarfile
}

amber.setup_test_folders amber17
export AMBERHOME=`python -c "import sys; print(sys.prefix)"`
cd $AMBERHOME/AmberTools/test
make test.cpptraj
make test.parmed
make test.pytraj
make test.pdb4amber
cd $AMBERHOME/test/sanderapi
make test
cd $AMBERHOME/test
make test.serial.sander.MM
make test.serial.sander.QM
