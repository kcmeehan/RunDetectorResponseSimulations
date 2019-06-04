#########################################################################
#  
# Code to post-process simulation output and obtain effective areas. 
# ** ASSUMES POINT SOURCE **
#
#########################################################################

# import libraries
import tables as tb
import numpy as np
import pandas as pd
import h5py
import healpy as hp
import sys

# Check number of arguments
if len(sys.argv) != 10:
	print("ERROR: processSimulationOutput.py requires 7 arguments")

# Read in arguments
theta = int(sys.argv[1])
phi = int(sys.argv[2])
Nevents = int(sys.argv[3])
energy = int(sys.argv[4])
source_rad = float(sys.argv[5])
source_dist = float(sys.argv[6])
nDet = int(sys.argv[7])
infile = str(sys.argv[8])
outfile = str(sys.argv[9])

# Effective area constant
Fluence = Nevents/((1.-np.cos(np.arctan(source_rad/source_dist)))*2*np.pi*source_dist**2)

# Obtaining efficiencies
eta = 0
eta_err = 0
det_eta = np.zeros(nDet)
det_eta_err = np.zeros(nDet)
# opening the file
with tb.open_file(infile, 'r') as file:
		# reading the data
		data = file.root.raw.data.read()
		df = pd.DataFrame(data)
		
# obtain total energies of events
total_energy = df.groupby('eventID').apply(lambda x: np.sum(x.E)) ## probably time-limiting step

# select on photopeak
mask_pp = total_energy >= energy-1

# calculate efficiency across all detectors
n_pp = len(total_energy[mask_pp])
eta = n_pp/Fluence
eta_err = np.sqrt(n_pp)/Fluence

# obtain total event energy per detector
groups = df.groupby(['eventID', 'detID'])
for idx, (name, group) in enumerate(groups):
		Esum = np.sum(group.E)
		# Cut on full energy peak
		if Esum >= energy-1:
			det_eta[name[1]] += 1

det_eta = det_eta/Fluence

det_eta_err = np.sqrt(det_eta)/Fluence

# Create an output file
with h5py.File(outfile,"w") as outfile:
		dset_index = outfile.create_dataset("theta", data=theta)
		dset_index = outfile.create_dataset("phi", data=phi)
		dset_eta = outfile.create_dataset("eta", data=eta)
		dset_eta_err = outfile.create_dataset("eta_err", data=eta_err)
		dset_eta_det = outfile.create_dataset("eta_per_det", data=det_eta)
		dset_eta_det_err = outfile.create_dataset("eta_per_det_err", data=det_eta_err)
