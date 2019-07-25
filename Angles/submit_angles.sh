#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=LBE_4p0
#SBATCH --partition=lr3
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=96
#SBATCH --output=/global/scratch/kmeehan/LBE_4p0_out.txt
#SBATCH --error=/global/scratch/kmeehan/LBE_4p0_err.txt

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/Tasklists/tasklist_first_rig_azim_scan_four_energies100000000.txt -L -v
