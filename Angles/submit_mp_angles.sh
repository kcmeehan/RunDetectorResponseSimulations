#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=mp_seconds
#SBATCH --partition=lr4
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=20
#SBATCH --error=/global/scratch/kmeehan/mp_seconds.err

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/Tasklists/tasklist_first_mp_rig_scan_100000000.txt -L -v
