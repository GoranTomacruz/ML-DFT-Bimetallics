#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV17 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=29           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.7.out     ##CHANGE
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
mpirun -np 29 pw.x -i Au-17.in > Ag-17.out  &&
mpirun -np 29 pw.x -i Cd-17.in > Cd-17.out &&
mpirun -np 29 pw.x -i Cr-17.in > Cr-17.out && 
mpirun -np 29 pw.x -i Cu-17.in > Cu-17.out &&
mpirun -np 29 pw.x -i Hf-17.in > Hf-17.out &&
mpirun -np 29 pw.x -i Hg-17.in > Hg-17.out &&
mpirun -np 29 pw.x -i Ir-17.in > Ir-17.out &&
mpirun -np 29 pw.x -i La-17.in > La-17.out &&
mpirun -np 29 pw.x -i Mo-17.in > Mo-17.out &&
mpirun -np 29 pw.x -i Nb-17.in > Nb-17.out &&
mpirun -np 29 pw.x -i Os-17.in > Os-17.out &&
mpirun -np 29 pw.x -i Pd-17.in > Pd-17.out &&
mpirun -np 29 pw.x -i Pt-17.in > Pt-17.out &&
mpirun -np 29 pw.x -i Re-17.in > Re-17.out &&
mpirun -np 29 pw.x -i Rh-17.in > Rh-17.out &&
mpirun -np 29 pw.x -i Ru-17.in > Ru-17.out &&
mpirun -np 29 pw.x -i Sc-17.in > Sc-17.out &&
mpirun -np 29 pw.x -i Ta-17.in > Ta-17.out &&
mpirun -np 29 pw.x -i Tc-17.in > Tc-17.out &&
mpirun -np 29 pw.x -i Ti-17.in > Ti-17.out &&
mpirun -np 29 pw.x -i V-17.in > V-17.out &&
mpirun -np 29 pw.x -i W-17.in > W-17.out &&
mpirun -np 29 pw.x -i Y-17.in > Y-17.out &&
mpirun -np 29 pw.x -i Zn-17.in > Zn-17.out &&
mpirun -np 29 pw.x -i Zr-17.in > Zr-17.out
