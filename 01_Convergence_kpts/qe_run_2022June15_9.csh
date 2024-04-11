#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV19 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=20           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.9.out     ##CHANGE
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
mpirun -np 20 pw.x -i Au-19.in > Ag-19.out  &&
mpirun -np 20 pw.x -i Cd-19.in > Cd-19.out &&
mpirun -np 20 pw.x -i Cr-19.in > Cr-19.out && 
mpirun -np 20 pw.x -i Cu-19.in > Cu-19.out &&
mpirun -np 20 pw.x -i Hf-19.in > Hf-19.out &&
mpirun -np 20 pw.x -i Hg-19.in > Hg-19.out &&
mpirun -np 20 pw.x -i Ir-19.in > Ir-19.out &&
mpirun -np 20 pw.x -i La-19.in > La-19.out &&
mpirun -np 20 pw.x -i Mo-19.in > Mo-19.out &&
mpirun -np 20 pw.x -i Nb-19.in > Nb-19.out &&
mpirun -np 20 pw.x -i Os-19.in > Os-19.out &&
mpirun -np 20 pw.x -i Pd-19.in > Pd-19.out &&
mpirun -np 20 pw.x -i Pt-19.in > Pt-19.out &&
mpirun -np 20 pw.x -i Re-19.in > Re-19.out &&
mpirun -np 20 pw.x -i Rh-19.in > Rh-19.out &&
mpirun -np 20 pw.x -i Ru-19.in > Ru-19.out &&
mpirun -np 20 pw.x -i Sc-19.in > Sc-19.out &&
mpirun -np 20 pw.x -i Ta-19.in > Ta-19.out &&
mpirun -np 20 pw.x -i Tc-19.in > Tc-19.out &&
mpirun -np 20 pw.x -i Ti-19.in > Ti-19.out &&
mpirun -np 20 pw.x -i V-19.in > V-19.out &&
mpirun -np 20 pw.x -i W-19.in > W-19.out &&
mpirun -np 20 pw.x -i Y-19.in > Y-19.out &&
mpirun -np 20 pw.x -i Zn-19.in > Zn-19.out &&
mpirun -np 20 pw.x -i Zr-19.in > Zr-19.out
