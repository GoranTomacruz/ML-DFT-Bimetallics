#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV12 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=3722June15files.2.out     ##CHANGE
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
mpirun -np 37 pw.x -i Au-12.in > Ag-12.out  &&
mpirun -np 37 pw.x -i Cd-12.in > Cd-12.out &&
mpirun -np 37 pw.x -i Cr-12.in > Cr-12.out && 
mpirun -np 37 pw.x -i Cu-12.in > Cu-12.out &&
mpirun -np 37 pw.x -i Hf-12.in > Hf-12.out &&
mpirun -np 37 pw.x -i Hg-12.in > Hg-12.out &&
mpirun -np 37 pw.x -i Ir-12.in > Ir-12.out &&
mpirun -np 37 pw.x -i La-12.in > La-12.out &&
mpirun -np 37 pw.x -i Mo-12.in > Mo-12.out &&
mpirun -np 37 pw.x -i Nb-12.in > Nb-12.out &&
mpirun -np 37 pw.x -i Os-12.in > Os-12.out &&
mpirun -np 37 pw.x -i Pd-12.in > Pd-12.out &&
mpirun -np 37 pw.x -i Pt-12.in > Pt-12.out &&
mpirun -np 37 pw.x -i Re-12.in > Re-12.out &&
mpirun -np 37 pw.x -i Rh-12.in > Rh-12.out &&
mpirun -np 37 pw.x -i Ru-12.in > Ru-12.out &&
mpirun -np 37 pw.x -i Sc-12.in > Sc-12.out &&
mpirun -np 37 pw.x -i Ta-12.in > Ta-12.out &&
mpirun -np 37 pw.x -i Tc-12.in > Tc-12.out &&
mpirun -np 37 pw.x -i Ti-12.in > Ti-12.out &&
mpirun -np 37 pw.x -i V-12.in > V-12.out &&
mpirun -np 37 pw.x -i W-12.in > W-12.out &&
mpirun -np 37 pw.x -i Y-12.in > Y-12.out &&
mpirun -np 37 pw.x -i Zn-12.in > Zn-12.out &&
mpirun -np 37 pw.x -i Zr-12.in > Zr-12.out


