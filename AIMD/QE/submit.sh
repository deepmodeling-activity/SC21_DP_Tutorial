#!/bin/bash
#SBATCH -N 1
#SBATCH -n 10
#SBATCH -p gpu
#SBATCH --gpus=geforce:1
#SBATCH --time=96:00:00
#SBATCH --mem=10G
#SBATCH --output=job.%J.out
#SBATCH --error=job.%J.err


ml load intel/2019.1.144 openmpi/4.0.1 espresso/6.4.1
#pw.x < c.md98.in
#cp.x < c.md98.cp.in
#cp.x < c.gs98.cp_1.in
mpirun -n 10 /apps/intel/2019.1.144/openmpi/4.0.1/espresso/6.4.1/bin/cp.x <graphene.gs.in > graphene.gs.out
mpirun -n 10 /apps/intel/2019.1.144/openmpi/4.0.1/espresso/6.4.1/bin/cp.x <graphene.in > graphene
