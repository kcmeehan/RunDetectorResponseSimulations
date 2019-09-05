#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=ff_test
#SBATCH --partition=lr3
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=20
#SBATCH --error=/global/scratch/kmeehan/ff_test.err

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/Tasklists/ff_tasklist_first_mp_rig_scan_100000000.txt -L -v
