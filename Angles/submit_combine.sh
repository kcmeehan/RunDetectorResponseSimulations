#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=combine
#SBATCH --partition=lr2
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --output=/global/scratch/kmeehan/combine_out.txt
#SBATCH --error=/global/scratch/kmeehan/combine_err.txt

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/Tasklists/combine_list.txt -L -v
