#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV11 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=20           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.1.out     ##CHANGE
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
mpirun -np 20 pw.x -i Au-11.in > Ag-11.out  &&
mpirun -np 20 pw.x -i Cd-11.in > Cd-11.out &&
mpirun -np 20 pw.x -i Cr-11.in > Cr-11.out && 
mpirun -np 20 pw.x -i Cu-11.in > Cu-11.out &&
mpirun -np 20 pw.x -i Hf-11.in > Hf-11.out &&
mpirun -np 20 pw.x -i Hg-11.in > Hg-11.out &&
mpirun -np 20 pw.x -i Ir-11.in > Ir-11.out &&
mpirun -np 20 pw.x -i La-11.in > La-11.out &&
mpirun -np 20 pw.x -i Mo-11.in > Mo-11.out &&
mpirun -np 20 pw.x -i Nb-11.in > Nb-11.out &&
mpirun -np 20 pw.x -i Os-11.in > Os-11.out &&
mpirun -np 20 pw.x -i Pd-11.in > Pd-11.out &&
mpirun -np 20 pw.x -i Pt-11.in > Pt-11.out &&
mpirun -np 20 pw.x -i Re-11.in > Re-11.out &&
mpirun -np 20 pw.x -i Rh-11.in > Rh-11.out &&
mpirun -np 20 pw.x -i Ru-11.in > Ru-11.out &&
mpirun -np 20 pw.x -i Sc-11.in > Sc-11.out &&
mpirun -np 20 pw.x -i Ta-11.in > Ta-11.out &&
mpirun -np 20 pw.x -i Tc-11.in > Tc-11.out &&
mpirun -np 20 pw.x -i Ti-11.in > Ti-11.out &&
mpirun -np 20 pw.x -i V-11.in > V-11.out &&
mpirun -np 20 pw.x -i W-11.in > W-11.out &&
mpirun -np 20 pw.x -i Y-11.in > Y-11.out &&
mpirun -np 20 pw.x -i Zn-11.in > Zn-11.out &&
mpirun -np 20 pw.x -i Zr-11.in > Zr-11.out 

