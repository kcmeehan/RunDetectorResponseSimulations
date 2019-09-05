import numpy as np

# Choose angles and other parameters
theta=90
phi = np.arange(0, 360, 15)
nEvents = 100000000
energies = [59, 662, 1332]
source_rad = 61
source_dist = 107
nDet = 4
field = 'far'

filename = "Tasklists/actual_ff_tasklist_cllbc_azim_scan"+str(nEvents)+".txt"

with open(filename, "w") as file:
	for energy in energies:
		for i in range(0, len(phi)):
			file.write("cd /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/ && ./run_simulation_angles_batch.sh " \
					+ str(int(theta)) + " " + str(phi[i]) + " " + str(nEvents) + " " + str(energy) + " " + str(source_rad) + " " + str(source_dist) + " " + str(nDet) + " " + field + "\n")
