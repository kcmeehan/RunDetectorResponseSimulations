#!/bin/bash

# Get function arguments
nside=$1
pixel=$2
nEvents=$3
energy=$4
source_rad=$5
source_dist=$6
nDet=$7
field=$8

source ~/.bash_profile

# Deactivate
if [ -n ${PYTHONPATH_BK}  ]; then
   PYTHONPATH=$PYTHONPATH_BK
fi
unset PYTHONPATH_BK
source deactivate 

# Activate environment
if [ -n ${PYTHONPATH} ]; then
   PYTHONPATH_BK=$PYTHONPATH
fi
unset PYTHONPATH
export PATH=/global/home/groups-sw/pc_sdfquant/anaconda2/bin:$PATH
. /global/home/groups-sw/pc_sdfquant/anaconda2/etc/profile.d/conda.sh
conda activate geant4py_km
. /global/home/groups-sw/pc_sdfquant/geant4/GEANT4.10.5.p0/geant4-install/share/Geant4-10.5.0/geant4make/geant4make.sh
. /global/home/groups-sw/pc_sdfquant/geant4/GEANT4.10.5.p0/geant4-install/bin/geant4.sh

cd /global/home/users/kmeehan/Repos/geant4py/scripts/

python miniprism.py -field $field -healpix $nside $pixel -out /global/home/users/kmeehan/SCRATCH/SimulationOutput/Nside$(($nside))/mp/TrackSecondaries/output_nside$(($nside))_miniprism_$(($pixel))_$((energy))keV -n $nEvents -E $energy 

cd /global/home/users/kmeehan/Repos/geant4py/lr_sims/Healpix/

python processMpSimulationOutput.py $nside $pixel $nEvents $field $energy $source_rad $source_dist $nDet /global/home/users/kmeehan/SCRATCH/SimulationOutput/Nside$(($nside))/mp/TrackSecondaries/output_nside$(($nside))_miniprism_$(($pixel))_$((energy))keV.h5 /global/home/users/kmeehan/SCRATCH/ProcessedOutput/Nside$(($nside))/mp/TrackSecondaries/processed_output_nside$(($nside))_miniprism_$(($pixel))_$((energy))keV.h5

