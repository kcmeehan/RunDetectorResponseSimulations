#!/bin/bash

# Get function arguments
theta=$1
phi=$2
nEvents=$3
energy=$4
source_rad=$5
source_dist=$6
nDet=$7

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

cd /global/home/users/kmeehan/Repos/geant4py/scripts/

python lamp_CLLBC.py -angle $theta $phi -out /global/home/users/kmeehan/SCRATCH/SimulationOutput/RigSims/LBE_4p0/output_lamp_cllbc_angle_$(($theta))_$(($phi))_$((energy))keV -n $nEvents -E $energy -rad $source_rad -d $source_dist

#python miniprism.py -angle $theta $phi -out /global/home/users/kmeehan/SCRATCH/SimulationOutput/output_miniprism_angle_$(($theta))_$(($phi))_$((energy))keV -n $nEvents -E $energy -rad $source_rad -d $source_dist

cd /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/

python processAngleSimulationOutput.py $theta $phi $nEvents $energy $source_rad $source_dist $nDet /global/home/users/kmeehan/SCRATCH/SimulationOutput/RigSims/LBE_4p0/output_lamp_cllbc_angle_$(($theta))_$(($phi))_$((energy))keV.h5 /global/home/users/kmeehan/SCRATCH/ProcessedOutput/RigSims/LBE_4p0/processed_output_lamp_cllbc_angle_$(($theta))_$(($phi))_$((energy))keV.h5

#python processAngleSimulationOutput.py $theta $phi $nEvents $energy $source_rad $source_dist $nDet /global/home/users/kmeehan/SCRATCH/SimulationOutput/output_miniprism_angle_$(($theta))_$(($phi))_$((energy))keV.h5 /global/home/users/kmeehan/SCRATCH/ProcessedOutput/processed_output_miniprism_angle_$(($theta))_$(($phi))_$((energy))keV.h5
