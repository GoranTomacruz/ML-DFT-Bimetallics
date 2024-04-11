#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV20 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=20           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.10.out     ##CHANGE
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
mpirun -np 20 pw.x -i Au-20.in > Ag-20.out  &&
mpirun -np 20 pw.x -i Cd-20.in > Cd-20.out &&
mpirun -np 20 pw.x -i Cr-20.in > Cr-20.out && 
mpirun -np 20 pw.x -i Cu-20.in > Cu-20.out &&
mpirun -np 20 pw.x -i Hf-20.in > Hf-20.out &&
mpirun -np 20 pw.x -i Hg-20.in > Hg-20.out &&
mpirun -np 20 pw.x -i Ir-20.in > Ir-20.out &&
mpirun -np 20 pw.x -i La-20.in > La-20.out &&
mpirun -np 20 pw.x -i Mo-20.in > Mo-20.out &&
mpirun -np 20 pw.x -i Nb-20.in > Nb-20.out &&
mpirun -np 20 pw.x -i Os-20.in > Os-20.out &&
mpirun -np 20 pw.x -i Pd-20.in > Pd-20.out &&
mpirun -np 20 pw.x -i Pt-20.in > Pt-20.out &&
mpirun -np 20 pw.x -i Re-20.in > Re-20.out &&
mpirun -np 20 pw.x -i Rh-20.in > Rh-20.out &&
mpirun -np 20 pw.x -i Ru-20.in > Ru-20.out &&
mpirun -np 20 pw.x -i Sc-20.in > Sc-20.out &&
mpirun -np 20 pw.x -i Ta-20.in > Ta-20.out &&
mpirun -np 20 pw.x -i Tc-20.in > Tc-20.out &&
mpirun -np 20 pw.x -i Ti-20.in > Ti-20.out &&
mpirun -np 20 pw.x -i V-20.in > V-20.out &&
mpirun -np 20 pw.x -i W-20.in > W-20.out &&
mpirun -np 20 pw.x -i Y-20.in > Y-20.out &&
mpirun -np 20 pw.x -i Zn-20.in > Zn-20.out &&
mpirun -np 20 pw.x -i Zr-20.in > Zr-20.out
