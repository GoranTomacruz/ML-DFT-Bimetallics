#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV13 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=17           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.3.out     ##CHANGE
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
mpirun -np 17 pw.x -i Au-13.in > Ag-13.out  &&
mpirun -np 17 pw.x -i Cd-13.in > Cd-13.out &&
mpirun -np 17 pw.x -i Cr-13.in > Cr-13.out && 
mpirun -np 17 pw.x -i Cu-13.in > Cu-13.out &&
mpirun -np 17 pw.x -i Hf-13.in > Hf-13.out &&
mpirun -np 17 pw.x -i Hg-13.in > Hg-13.out &&
mpirun -np 17 pw.x -i Ir-13.in > Ir-13.out &&
mpirun -np 17 pw.x -i La-13.in > La-13.out &&
mpirun -np 17 pw.x -i Mo-13.in > Mo-13.out &&
mpirun -np 17 pw.x -i Nb-13.in > Nb-13.out &&
mpirun -np 17 pw.x -i Os-13.in > Os-13.out &&
mpirun -np 17 pw.x -i Pd-13.in > Pd-13.out &&
mpirun -np 17 pw.x -i Pt-13.in > Pt-13.out &&
mpirun -np 17 pw.x -i Re-13.in > Re-13.out &&
mpirun -np 17 pw.x -i Rh-13.in > Rh-13.out &&
mpirun -np 17 pw.x -i Ru-13.in > Ru-13.out &&
mpirun -np 17 pw.x -i Sc-13.in > Sc-13.out &&
mpirun -np 17 pw.x -i Ta-13.in > Ta-13.out &&
mpirun -np 17 pw.x -i Tc-13.in > Tc-13.out &&
mpirun -np 17 pw.x -i Ti-13.in > Ti-13.out &&
mpirun -np 17 pw.x -i V-13.in > V-13.out &&
mpirun -np 17 pw.x -i W-13.in > W-13.out &&
mpirun -np 17 pw.x -i Y-13.in > Y-13.out &&
mpirun -np 17 pw.x -i Zn-13.in > Zn-13.out &&
mpirun -np 17 pw.x -i Zr-13.in > Zr-13.out

