#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV14 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=20           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.4.out     ##CHANGE
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
mpirun -np 20 pw.x -npool 5 -i Au-14.in > Ag-14.out  &&
mpirun -np 20 pw.x -npool 5 -i Cd-14.in > Cd-14.out &&
mpirun -np 20 pw.x -npool 5 -i Cr-14.in > Cr-14.out && 
mpirun -np 20 pw.x -npool 5 -i Cu-14.in > Cu-14.out &&
mpirun -np 20 pw.x -npool 5 -i Hf-14.in > Hf-14.out &&
mpirun -np 20 pw.x -npool 5 -i Hg-14.in > Hg-14.out &&
mpirun -np 20 pw.x -npool 5 -i Ir-14.in > Ir-14.out &&
mpirun -np 20 pw.x -npool 5 -i La-14.in > La-14.out &&
mpirun -np 20 pw.x -npool 5 -i Mo-14.in > Mo-14.out &&
mpirun -np 20 pw.x -npool 5 -i Nb-14.in > Nb-14.out &&
mpirun -np 20 pw.x -npool 5 -i Os-14.in > Os-14.out &&
mpirun -np 20 pw.x -npool 5 -i Pd-14.in > Pd-14.out &&
mpirun -np 20 pw.x -npool 5 -i Pt-14.in > Pt-14.out &&
mpirun -np 20 pw.x -npool 5 -i Re-14.in > Re-14.out &&
mpirun -np 20 pw.x -npool 5 -i Rh-14.in > Rh-14.out &&
mpirun -np 20 pw.x -npool 5 -i Ru-14.in > Ru-14.out &&
mpirun -np 20 pw.x -npool 5 -i Sc-14.in > Sc-14.out &&
mpirun -np 20 pw.x -npool 5 -i Ta-14.in > Ta-14.out &&
mpirun -np 20 pw.x -npool 5 -i Tc-14.in > Tc-14.out &&
mpirun -np 20 pw.x -npool 5 -i Ti-14.in > Ti-14.out &&
mpirun -np 20 pw.x -npool 5 -i V-14.in > V-14.out &&
mpirun -np 20 pw.x -npool 5 -i W-14.in > W-14.out &&
mpirun -np 20 pw.x -npool 5 -i Y-14.in > Y-14.out &&
mpirun -np 20 pw.x -npool 5 -i Zn-14.in > Zn-14.out &&
mpirun -np 20 pw.x -npool 5 -i Zr-14.in > Zr-14.out
