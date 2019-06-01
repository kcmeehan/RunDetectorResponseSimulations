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

# Activate environment (g4conda)
export PATH=/global/home/groups-sw/pc_sdfquant/anaconda2/bin:$PATH
. /global/home/groups-sw/pc_sdfquant/anaconda2/etc/profile.d/conda.sh
conda activate geant4py_km
. /global/home/groups-sw/pc_sdfquant/geant4/GEANT4.10.5.p0/geant4-install/share/Geant4-10.5.0/geant4make/geant4make.sh
. /global/home/groups-sw/pc_sdfquant/geant4/GEANT4.10.5.p0/geant4-install/bin/geant4.sh

cd /global/home/users/kmeehan/RealRepos/geant4py/scripts/

python2.7 lamp_CLLBC.py -angle $theta $phi -out /global/home/users/kmeehan/SCRATCH/SimulationOutput/Testing/output_lamp_cllbc_angle_$(($theta))_$(($phi))_$((energy))keV -n $nEvents -E $energy -rad $source_rad -d $source_dist

cd /global/home/users/kmeehan/RealRepos/geant4py/lr_sims/Angles/

python2.7 processAngleSimulationOutput.py $theta $phi $nEvents $energy $source_rad $source_dist $nDet /global/home/users/kmeehan/SCRATCH/SimulationOutput/Testing/output_lamp_cllbc_angle_$(($theta))_$(($phi))_$((energy))keV.h5 /global/home/users/kmeehan/SCRATCH/ProcessedOutput/Testing/processed_output_lamp_cllbc_angle_$(($theta))_$(($phi))_$((energy))keV.h5

#python2.7 miniprism.py -angle $theta $phi -out /global/home/users/kmeehan/SCRATCH/SimulationOutput/output_miniprism_angle_$(($theta))_$(($phi))_$((energy))keV.h5 -n $nEvents -E $energy
#
#python2.7 processAngleSimulationOutput.py $theta $phi $nEvents $energy $nDet /global/home/users/kmeehan/SCRATCH/SimulationOutput/output_miniprism_angle_$(($theta))_$(($phi))_$((energy))keV.h5 /global/home/users/kmeehan/SCRATCH/ProcessedOutput/processed_output_miniprism_angle_$(($theta))_$(($phi))_$((energy))keV.h5
#
