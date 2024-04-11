#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV10 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=13           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.0.out     ##CHANGE
#SBATCH --mail-user=jttomacruz@up.edu.ph    ##CHANGE
#SBATCH --mail-type=ALL
#SBATCH --requeue

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory = "$SLURM_SUBMIT_DIR

module load openblas/0.3.9
module load fftw/3.3.8
module load qe/6.6_openmpi-4.0.3

ulimit -s unlimited

export OMP_NUM_THREADS=1

##cd to working directory
mpirun -np 13 pw.x -i Ag-10.in > Ag-10.out  &&
mpirun -np 13 pw.x -i Au-10.in > Au-10.out  &&
mpirun -np 13 pw.x -i Cd-10.in > Cd-10.out &&
mpirun -np 13 pw.x -i Cr-10.in > Cr-10.out && 
mpirun -np 13 pw.x -i Cu-10.in > Cu-10.out &&
mpirun -np 13 pw.x -i Hf-10.in > Hf-10.out &&
mpirun -np 13 pw.x -i Hg-10.in > Hg-10.out &&
mpirun -np 13 pw.x -i Ir-10.in > Ir-10.out &&
mpirun -np 13 pw.x -i La-10.in > La-10.out &&
mpirun -np 13 pw.x -i Mo-10.in > Mo-10.out &&
mpirun -np 13 pw.x -i Nb-10.in > Nb-10.out &&
mpirun -np 13 pw.x -i Os-10.in > Os-10.out &&
mpirun -np 13 pw.x -i Pd-10.in > Pd-10.out &&
mpirun -np 13 pw.x -i Pt-10.in > Pt-10.out &&
mpirun -np 13 pw.x -i Re-10.in > Re-10.out &&
mpirun -np 13 pw.x -i Rh-10.in > Rh-10.out &&
mpirun -np 13 pw.x -i Ru-10.in > Ru-10.out &&
mpirun -np 13 pw.x -i Sc-10.in > Sc-10.out &&
mpirun -np 13 pw.x -i Ta-10.in > Ta-10.out &&
mpirun -np 13 pw.x -i Tc-10.in > Tc-10.out &&
mpirun -np 13 pw.x -i Ti-10.in > Ti-10.out &&
mpirun -np 13 pw.x -i V-10.in > V-10.out &&
mpirun -np 13 pw.x -i W-10.in > W-10.out &&
mpirun -np 13 pw.x -i Y-10.in > Y-10.out &&
mpirun -np 13 pw.x -i Zn-10.in > Zn-10.out &&
mpirun -np 13 pw.x -i Zr-10.in > Zr-10.out && 
mpirun -np 13 pw.x -i Co-10.in > Co-10.out &&
mpirun -np 13 pw.x -i Mn-10.in > Mn-10.out &&
mpirun -np 13 pw.x -i Fe-10.in > Fe-10.out &&
mpirun -np 13 pw.x -i Ni-10.in > Ni-10.out 

