import numpy as np
import healpy as hp

# Choose angles and other parameters
nside=16
npix = hp.nside2npix(nside)
nEvents = [1000000, 1000000, 4000000, 4000000, 4000000]
energies = [59, 186, 356, 662, 1332]
source_rad = 61
source_dist = 107
nDet = 4

filename = "Tasklists/tasklist_nside16_cllbc_geomv2.txt"

# Run 8 pixels at all five energies in parallel
npixperjob = npix/8

with open(filename, "w") as file:
	for i in range(0, npixperjob):
		file.write("cd /global/home/users/kmeehan/lr_sims/Healpix/ && ")
		for j in range(0, 8):
			for energy, nGammas in zip(energies, nEvents):
				if j == 7 and energy == 1332:
					file.write("./run_simulation_batch.sh " + str(nside) + " " + str(i*8 + j) + " " + str(nGammas) + " " + str(energy) + " " \
							              + str(source_rad) + " " + str(source_dist) + " " + str(nDet) + " ")
				else:
					file.write("./run_simulation_batch.sh " + str(nside) + " " + str(i*8 + j) + " " + str(nGammas) + " " + str(energy) + " " \
							+ str(source_rad) + " " + str(source_dist) + " " + str(nDet) + " && ")


		file.write("\n")
