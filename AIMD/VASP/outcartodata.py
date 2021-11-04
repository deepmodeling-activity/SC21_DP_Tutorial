import numpy as np
import dpdata
d_outcar = dpdata.LabeledSystem('OUTCAR', fmt = 'vasp/outcar')
print(d_outcar)
idx = d_outcar.shuffle()
d_outcar_shuffled = dpdata.LabeledSystem()
for ii in idx:
  d_outcar_shuffled.append(d_outcar.sub_system(ii))
Nsets = 5
Neach = 200
for i in range(Nsets):
  print(d_outcar_shuffled.sub_system(np.arange(i*Neach, (i+1)*Neach).tolist()).get_nframes())
  d_outcar_shuffled.sub_system(np.arange(i*Neach, (i+1)*Neach).tolist()).to("deepmd/npy", "deepmd_data/"+str(i), set_size=Neach)
