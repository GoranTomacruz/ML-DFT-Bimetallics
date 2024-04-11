#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV16 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=26           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.6.out     ##CHANGE
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
mpirun -np 26 pw.x -i Au-16.in > Ag-16.out  &&
mpirun -np 26 pw.x -i Cd-16.in > Cd-16.out &&
mpirun -np 26 pw.x -i Cr-16.in > Cr-16.out && 
mpirun -np 26 pw.x -i Cu-16.in > Cu-16.out &&
mpirun -np 26 pw.x -i Hf-16.in > Hf-16.out &&
mpirun -np 26 pw.x -i Hg-16.in > Hg-16.out &&
mpirun -np 26 pw.x -i Ir-16.in > Ir-16.out &&
mpirun -np 26 pw.x -i La-16.in > La-16.out &&
mpirun -np 26 pw.x -i Mo-16.in > Mo-16.out &&
mpirun -np 26 pw.x -i Nb-16.in > Nb-16.out &&
mpirun -np 26 pw.x -i Os-16.in > Os-16.out &&
mpirun -np 26 pw.x -i Pd-16.in > Pd-16.out &&
mpirun -np 26 pw.x -i Pt-16.in > Pt-16.out &&
mpirun -np 26 pw.x -i Re-16.in > Re-16.out &&
mpirun -np 26 pw.x -i Rh-16.in > Rh-16.out &&
mpirun -np 26 pw.x -i Ru-16.in > Ru-16.out &&
mpirun -np 26 pw.x -i Sc-16.in > Sc-16.out &&
mpirun -np 26 pw.x -i Ta-16.in > Ta-16.out &&
mpirun -np 26 pw.x -i Tc-16.in > Tc-16.out &&
mpirun -np 26 pw.x -i Ti-16.in > Ti-16.out &&
mpirun -np 26 pw.x -i V-16.in > V-16.out &&
mpirun -np 26 pw.x -i W-16.in > W-16.out &&
mpirun -np 26 pw.x -i Y-16.in > Y-16.out &&
mpirun -np 26 pw.x -i Zn-16.in > Zn-16.out &&
mpirun -np 26 pw.x -i Zr-16.in > Zr-16.out
