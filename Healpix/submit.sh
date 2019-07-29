#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=cllbc_n12
#SBATCH --partition=lr3
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=384
#SBATCH --error=/global/scratch/kmeehan/cllbc_nside12.err

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Healpix/Tasklists/tasklist_nside16_cllbc_1000000.txt -L -v
