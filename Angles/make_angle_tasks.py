import numpy as np

# Choose angles and other parameters
theta=90
phi = np.arange(0, 360, 15)
nEvents = 100000000
energies = [59, 356, 662, 1332]
source_rad = 61
source_dist = 107
nDet = 4

filename = "Tasklists/tasklist_first_rig_azim_scan_four_energies"+str(nEvents)+".txt"

nPhis=len(phi)

with open(filename, "w") as file:
	for i in range(0, nPhis):
		file.write("cd /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/ && ./run_simulation_angles_batch.sh " \
				+ str(int(theta)) + " " + str(phi[i]) + " " + str(nEvents) + " " + str(energies[0]) + " " + str(source_rad) + " " + str(source_dist) + " " + str(nDet) + "\n")
		file.write("cd /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/ && ./run_simulation_angles_batch.sh " \
				+ str(int(theta)) + " " + str(phi[i]) + " " + str(nEvents) + " " + str(energies[1]) + " " + str(source_rad) + " " + str(source_dist) + " " + str(nDet) + "\n")
		file.write("cd /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/ && ./run_simulation_angles_batch.sh " \
				+ str(int(theta)) + " " + str(phi[i]) + " " + str(nEvents) + " " + str(energies[2]) + " " + str(source_rad) + " " + str(source_dist) + " " + str(nDet) + "\n")
		file.write("cd /global/home/users/kmeehan/Repos/geant4py/lr_sims/Angles/ && ./run_simulation_angles_batch.sh " \
				+ str(int(theta)) + " " + str(phi[i]) + " " + str(nEvents) + " " + str(energies[3]) + " " + str(source_rad) + " " + str(source_dist) + " " + str(nDet) + "\n")
