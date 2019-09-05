# import libraries
import tables as tb
import numpy as np
import h5py
import healpy as hp

# Define simulation parameters
theta=90
#phi=np.arange(0, 105, 15)
#source_energies=[59]
#phi=np.arange(0, 105, 15)
phi=np.arange(0, 360, 15)
#source_energies=[59, 356, 662, 1332]
source_energies=[59, 662]
nDet=4
detector='lamp_cllbc'
file_prefix='/global/home/users/kmeehan/SCRATCH/ProcessedOutput/RigSims/QGSP_BERT_HP/processed_output_'+detector+'_angle_'+str(theta)+'_'

nAngles=len(phi)

for energy in source_energies:
	# Create data containers
	eta = np.empty(nAngles)
	eta_err = np.empty(nAngles)
	eta_det = np.empty((nAngles, nDet))
	eta_det_err = np.empty((nAngles, nDet))

	# Loop over all the processed output files and fill the data containers
	for i in range(0, nAngles): 
			filename = file_prefix+str(phi[i])+'_'+str(energy)+'keV.h5'
			with tb.open_file(filename, 'r') as file:
					eta[i] = float(file.root.eta.read())
					eta_err[i] = float(file.root.eta_err.read())
					eta_det[i] = file.root.eta_per_det.read()
					eta_det_err[i] = file.root.eta_per_det_err.read()

	# Save final data to a single output file
	outfile='qgsp_bert_hp_combined_output_'+detector+'_'+str(energy)+'keV_angles.h5'
	with h5py.File(outfile,"w") as outfile:
			outfile.create_dataset("theta", data=theta)
			outfile.create_dataset("phi", data=phi)
			outfile.create_dataset("eta", data=eta)
			outfile.create_dataset("eta_err", data=eta_err)
			outfile.create_dataset("eta_per_det", data=eta_det)
			outfile.create_dataset("eta_per_det_err", data=eta_det_err)
