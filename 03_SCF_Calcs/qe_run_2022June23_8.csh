#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-8##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June23files.8.out     ##CHANGE
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
mpirun -np 37 pw.x -i Cr2La2.in > Cr2La2.out &&
mpirun -np 37 pw.x -i Cu2La2.in > Cu2La2.out &&
mpirun -np 37 pw.x -i La2Ag2.in > La2Ag2.out &&
mpirun -np 37 pw.x -i La2Au2.in > La2Au2.out &&
mpirun -np 37 pw.x -i La2Cd2.in > La2Cd2.out &&
mpirun -np 37 pw.x -i La2Hf2.in > La2Hf2.out &&
mpirun -np 37 pw.x -i La2Hg2.in > La2Hg2.out &&
mpirun -np 37 pw.x -i La2Ir2.in > La2Ir2.out &&
mpirun -np 37 pw.x -i La2Mo2.in > La2Mo2.out &&
mpirun -np 37 pw.x -i La2Nb2.in > La2Nb2.out &&
mpirun -np 37 pw.x -i La2Os2.in > La2Os2.out &&
mpirun -np 37 pw.x -i La2Pd2.in > La2Pd2.out &&
mpirun -np 37 pw.x -i La2Pt2.in > La2Pt2.out &&
mpirun -np 37 pw.x -i La2Re2.in > La2Re2.out &&
mpirun -np 37 pw.x -i La2Rh2.in > La2Rh2.out &&
mpirun -np 37 pw.x -i La2Ru2.in > La2Ru2.out &&
mpirun -np 37 pw.x -i La2Ta2.in > La2Ta2.out &&
mpirun -np 37 pw.x -i La2Tc2.in > La2Tc2.out &&
mpirun -np 37 pw.x -i La2W2.in > La2W2.out &&
mpirun -np 37 pw.x -i La2Y2.in > La2Y2.out &&
mpirun -np 37 pw.x -i La2Zr2.in > La2Zr2.out &&
mpirun -np 37 pw.x -i Sc2La2.in > Sc2La2.out &&
mpirun -np 37 pw.x -i Ti2La2.in > Ti2La2.out &&
mpirun -np 37 pw.x -i V2La2.in > V2La2.out &&
mpirun -np 37 pw.x -i Zn2La2.in > Zn2La2.out
