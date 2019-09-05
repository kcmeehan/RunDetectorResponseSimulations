#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=actual_far
#SBATCH --partition=lr4
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=72
#SBATCH --error=/global/scratch/kmeehan/actual_far.err
#SBATCH --time=3:0:00

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/Tasklists/actual_ff_tasklist_cllbc_azim_scan100000000.txt -L -v
