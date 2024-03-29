import numpy as np
import healpy as hp

# Choose angles and other parameters
nside=16
npix = hp.nside2npix(nside)
nEvents = 40000000
energies = [662, 1332]
source_rad = 61
source_dist = 110.5
nDet = 192
field = 'far'

filename = "Tasklists/tasklist_nside16_mp_"+str(nEvents)+".txt"

# Run 8 pixels at all five energies in parallel
npixperjob = npix/6

with open(filename, "w") as file:
	for i in range(0, npixperjob):
		file.write("cd /global/home/users/kmeehan/lr_sims/Healpix/ && ")
		for j in range(0, 6):
			for k in range(0, len(energies)):
				if j == 5 and k == len(energies)-1:
					file.write("./run_mp_simulation_batch.sh " + str(nside) + " " + str(i*6 + j) + " " + str(nEvents) + " " + str(energies[k]) + " " \
							+ str(source_rad) + " " + str(source_dist) + " " + str(nDet) + " " + field + " ")
				else:
					file.write("./run_mp_simulation_batch.sh " + str(nside) + " " + str(i*6 + j) + " " + str(nEvents) + " " + str(energies[k]) + " " \
							+ str(source_rad) + " " + str(source_dist) + " " + str(nDet) + " " + field + " && ")

		file.write("\n")
