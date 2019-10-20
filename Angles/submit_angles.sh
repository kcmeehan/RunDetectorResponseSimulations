#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=ng_seconds
#SBATCH --partition=lr4
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=96
#SBATCH --error=/global/scratch/kmeehan/ng_seconds.err
#SBATCH --time=24:0:00

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/Tasklists/tasklist_first_rig_azim_scan_four_energies100000000.txt -L -v
