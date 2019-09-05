import numpy as np

# Choose angles and other parameters
theta=90
#phi_Cs = np.arange(0, 195, 15)
#phi_Am = np.arange(0, 105, 15)
nEvents = 100000000
#energies = [59, 356, 662, 1332]
energies = [59, 662]
source_rad = 61
source_dist = 107
nDet = 192

filename = "Tasklists/nf_tasklist_first_mp_rig_scan_"+str(nEvents)+".txt"

with open(filename, "w") as file:
	for i in range(0, len(phi_Cs)):
		file.write("cd /global/home/users/kmeehan/Repos/nf_geant4py/lr_sims/Angles/ && ./run_nf_simulation_angles_batch.sh " \
				+ str(int(theta)) + " " + str(phi_Cs[i]) + " " + str(nEvents) + " " + str(energies[1]) + " " + str(source_rad) + " " + str(source_dist) + " " + str(nDet) + "\n")

	for i in range(0, len(phi_Am)):		
		file.write("cd /global/home/users/kmeehan/Repos/nf_geant4py/lr_sims/Angles/ && ./run_nf_simulation_angles_batch.sh " \
				+ str(int(theta)) + " " + str(phi_Am[i]) + " " + str(nEvents) + " " + str(energies[0]) + " " + str(source_rad) + " " + str(source_dist) + " " + str(nDet) + "\n")
