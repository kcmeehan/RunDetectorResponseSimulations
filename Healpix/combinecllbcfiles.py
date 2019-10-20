# import libraries
import tables as tb
import numpy as np
import pandas as pd
import h5py
import healpy as hp

# Define simulation parameters
nside = 16
npix = hp.nside2npix(nside)
pix = range(0, npix)
source_energies=[59, 186, 356, 662, 1332]
#source_energies=[356, 662, 1332]
nDet=4
detector='lamp_cllbc'
file_prefix='/global/home/users/kmeehan/SCRATCH/ProcessedOutput/Nside16/cllbc_lamp/TrackSecondaries/processed_output_nside'+str(nside)+'_'+detector+'_'

for energy in source_energies:
	# Create data containers
	eta = np.empty(npix)
	eta_err = np.empty(npix)
	eta_det = np.empty((npix, nDet))
	eta_det_err = np.empty((npix, nDet))

	# Loop over all the processed output files and fill the data containers
	for i in range(0, npix): 
			filename = file_prefix+str(pix[i])+'_'+str(energy)+'keV.h5'
			with tb.open_file(filename, 'r') as file:
					eta[i] = float(file.root.eta.read())
					eta_err[i] = float(file.root.eta_err.read())
					eta_det[i] = file.root.eta_per_det.read()
					eta_det_err[i] = file.root.eta_per_det_err.read()

	# Save final data to a single output file
	outfile='n16_withsecondaries_combined_output_'+detector+'_'+str(energy)+'keV.h5'
	with h5py.File(outfile,"w") as outfile:
			outfile.create_dataset("nside", data=nside)
			outfile.create_dataset("pix", data=pix)
			outfile.create_dataset("eta", data=eta)
			outfile.create_dataset("eta_err", data=eta_err)
			outfile.create_dataset("eta_per_det", data=eta_det)
			outfile.create_dataset("eta_per_det_err", data=eta_det_err)
