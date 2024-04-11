#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-10##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July02files.10.out     ##CHANGE
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
mpirun -np 37 pw.x -i Co2Ag2.in > Co2Ag2.out &&
mpirun -np 37 pw.x -i Co2Au2.in > Co2Au2.out &&
mpirun -np 37 pw.x -i Co2Cd2.in > Co2Cd2.out &&
mpirun -np 37 pw.x -i Co2Cu2.in > Co2Cu2.out &&
mpirun -np 37 pw.x -i Co2Hf2.in > Co2Hf2.out &&
mpirun -np 37 pw.x -i Co2Hg2.in > Co2Hg2.out &&
mpirun -np 37 pw.x -i Co2Ir2.in > Co2Ir2.out &&
mpirun -np 37 pw.x -i Co2La2.in > Co2La2.out &&
mpirun -np 37 pw.x -i Co2Ni2.in > Co2Ni2.out &&
mpirun -np 37 pw.x -i Co2Os2.in > Co2Os2.out &&
mpirun -np 37 pw.x -i Co2Pd2.in > Co2Pd2.out &&
mpirun -np 37 pw.x -i Co2Pt2.in > Co2Pt2.out &&
mpirun -np 37 pw.x -i Co2Re2.in > Co2Re2.out &&
mpirun -np 37 pw.x -i Co2Rh2.in > Co2Rh2.out &&
mpirun -np 37 pw.x -i Co2Ru2.in > Co2Ru2.out &&
mpirun -np 37 pw.x -i Co2Sc2.in > Co2Sc2.out &&
mpirun -np 37 pw.x -i Co2Ti2.in > Co2Ti2.out &&
mpirun -np 37 pw.x -i Co2V2.in > Co2V2.out &&
mpirun -np 37 pw.x -i Co2W2.in > Co2W2.out &&
mpirun -np 37 pw.x -i Co2Y2.in > Co2Y2.out &&
mpirun -np 37 pw.x -i Co2Zn2.in > Co2Zn2.out &&
mpirun -np 37 pw.x -i Co2Zr2.in > Co2Zr2.out
