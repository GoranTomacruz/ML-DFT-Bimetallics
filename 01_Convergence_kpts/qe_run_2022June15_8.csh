#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV18 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=41           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.8.out     ##CHANGE
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
mpirun -np 41 pw.x -i Au-18.in > Ag-18.out  &&
mpirun -np 41 pw.x -i Cd-18.in > Cd-18.out &&
mpirun -np 41 pw.x -i Cr-18.in > Cr-18.out && 
mpirun -np 41 pw.x -i Cu-18.in > Cu-18.out &&
mpirun -np 41 pw.x -i Hf-18.in > Hf-18.out &&
mpirun -np 41 pw.x -i Hg-18.in > Hg-18.out &&
mpirun -np 41 pw.x -i Ir-18.in > Ir-18.out &&
mpirun -np 41 pw.x -i La-18.in > La-18.out &&
mpirun -np 41 pw.x -i Mo-18.in > Mo-18.out &&
mpirun -np 41 pw.x -i Nb-18.in > Nb-18.out &&
mpirun -np 41 pw.x -i Os-18.in > Os-18.out &&
mpirun -np 41 pw.x -i Pd-18.in > Pd-18.out &&
mpirun -np 41 pw.x -i Pt-18.in > Pt-18.out &&
mpirun -np 41 pw.x -i Re-18.in > Re-18.out &&
mpirun -np 41 pw.x -i Rh-18.in > Rh-18.out &&
mpirun -np 41 pw.x -i Ru-18.in > Ru-18.out &&
mpirun -np 41 pw.x -i Sc-18.in > Sc-18.out &&
mpirun -np 41 pw.x -i Ta-18.in > Ta-18.out &&
mpirun -np 41 pw.x -i Tc-18.in > Tc-18.out &&
mpirun -np 41 pw.x -i Ti-18.in > Ti-18.out &&
mpirun -np 41 pw.x -i V-18.in > V-18.out &&
mpirun -np 41 pw.x -i W-18.in > W-18.out &&
mpirun -np 41 pw.x -i Y-18.in > Y-18.out &&
mpirun -np 41 pw.x -i Zn-18.in > Zn-18.out &&
mpirun -np 41 pw.x -i Zr-18.in > Zr-18.out
