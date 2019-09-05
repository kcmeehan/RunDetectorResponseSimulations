#!/bin/bash

#SBATCH --export=ALL
#SBATCH --job-name=QGSP_BERT_HP
#SBATCH --partition=lr3
#SBATCH --qos=lr_normal
#SBATCH --account=pc_sdfquant
#SBATCH --ntasks=48
#SBATCH --error=/global/scratch/kmeehan/QGSP_BERT_HP.err

ht_helper.sh -t /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/Tasklists/trackgammas_tasklist_cllbc_azim_scan100000000.txt -L -v
