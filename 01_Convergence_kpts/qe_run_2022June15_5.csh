#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV15 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=20           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.5.out     ##CHANGE
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
mpirun -np 20 pw.x -i Au-15.in > Ag-15.out  &&
mpirun -np 20 pw.x -i Cd-15.in > Cd-15.out &&
mpirun -np 20 pw.x -i Cr-15.in > Cr-15.out && 
mpirun -np 20 pw.x -i Cu-15.in > Cu-15.out &&
mpirun -np 20 pw.x -i Hf-15.in > Hf-15.out &&
mpirun -np 20 pw.x -i Hg-15.in > Hg-15.out &&
mpirun -np 20 pw.x -i Ir-15.in > Ir-15.out &&
mpirun -np 20 pw.x -i La-15.in > La-15.out &&
mpirun -np 20 pw.x -i Mo-15.in > Mo-15.out &&
mpirun -np 20 pw.x -i Nb-15.in > Nb-15.out &&
mpirun -np 20 pw.x -i Os-15.in > Os-15.out &&
mpirun -np 20 pw.x -i Pd-15.in > Pd-15.out &&
mpirun -np 20 pw.x -i Pt-15.in > Pt-15.out &&
mpirun -np 20 pw.x -i Re-15.in > Re-15.out &&
mpirun -np 20 pw.x -i Rh-15.in > Rh-15.out &&
mpirun -np 20 pw.x -i Ru-15.in > Ru-15.out &&
mpirun -np 20 pw.x -i Sc-15.in > Sc-15.out &&
mpirun -np 20 pw.x -i Ta-15.in > Ta-15.out &&
mpirun -np 20 pw.x -i Tc-15.in > Tc-15.out &&
mpirun -np 20 pw.x -i Ti-15.in > Ti-15.out &&
mpirun -np 20 pw.x -i V-15.in > V-15.out &&
mpirun -np 20 pw.x -i W-15.in > W-15.out &&
mpirun -np 20 pw.x -i Y-15.in > Y-15.out &&
mpirun -np 20 pw.x -i Zn-15.in > Zn-15.out &&
mpirun -np 20 pw.x -i Zr-15.in > Zr-15.out

