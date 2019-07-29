#!/bin/bash

source ~/.bash_profile

# Deactivate
if [ -n ${PYTHONPATH_BK}  ]; then
   PYTHONPATH=$PYTHONPATH_BK
fi
unset PYTHONPATH_BK
source deactivate

# Activate environment (g4conda)
if [ -n ${PYTHONPATH}  ]; then
	   PYTHONPATH_BK=$PYTHONPATH
fi
unset PYTHONPATH
export PATH=/global/home/groups-sw/pc_sdfquant/anaconda2/bin:$PATH
. /global/home/groups-sw/pc_sdfquant/anaconda2/etc/profile.d/conda.sh
conda activate geant4py_km
. /global/home/groups-sw/pc_sdfquant/geant4/GEANT4.10.5.p0/geant4-install/share/Geant4-10.5.0/geant4make/geant4make.sh
. /global/home/groups-sw/pc_sdfquant/geant4/GEANT4.10.5.p0/geant4-install/bin/geant4.sh

cd /global/home/users/kmeehan/Repos/geant4py/lr_sims/Healpix/

python combinempfiles.py
