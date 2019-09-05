#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=newgeom_combine
#SBATCH --partition=lr3
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --error=/global/scratch/kmeehan/newgeom_combine_err.txt

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Healpix/Tasklists/combine_list.txt
