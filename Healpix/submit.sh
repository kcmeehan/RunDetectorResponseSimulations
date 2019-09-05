#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=mp40M
#SBATCH --partition=lr4
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=512
#SBATCH --error=/global/scratch/kmeehan/mp40M.err

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Healpix/Tasklists/tasklist_nside16_mp_40000000.txt -L -v
