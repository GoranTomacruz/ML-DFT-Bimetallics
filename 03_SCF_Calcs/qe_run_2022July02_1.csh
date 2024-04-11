#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-1##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July02files.1.out     ##CHANGE
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
mpirun -np 37 pw.x -i Ag2W2.in > Ag2W2.out &&
mpirun -np 37 pw.x -i Cd2W2.in > Cd2W2.out &&
mpirun -np 37 pw.x -i Cr2Pd2.in > Cr2Pd2.out &&
mpirun -np 37 pw.x -i Cr2W2.in > Cr2W2.out &&
mpirun -np 37 pw.x -i Cu2Pd2.in > Cu2Pd2.out &&
mpirun -np 37 pw.x -i Cu2W2.in > Cu2W2.out &&
mpirun -np 37 pw.x -i Mo2Pd2.in > Mo2Pd2.out &&
mpirun -np 37 pw.x -i Mo2W2.in > Mo2W2.out &&
mpirun -np 37 pw.x -i Nb2Pd2.in > Nb2Pd2.out &&
mpirun -np 37 pw.x -i Nb2W2.in > Nb2W2.out &&
mpirun -np 37 pw.x -i Pd2Ag2.in > Pd2Ag2.out &&
mpirun -np 37 pw.x -i Pd2Au2.in > Pd2Au2.out &&
mpirun -np 37 pw.x -i Pd2Cd2.in > Pd2Cd2.out &&
mpirun -np 37 pw.x -i Pd2Hg2.in > Pd2Hg2.out &&
mpirun -np 37 pw.x -i Pd2Ir2.in > Pd2Ir2.out &&
mpirun -np 37 pw.x -i Pd2Os2.in > Pd2Os2.out &&
mpirun -np 37 pw.x -i Pd2Pt2.in > Pd2Pt2.out &&
mpirun -np 37 pw.x -i Pd2Re2.in > Pd2Re2.out &&
mpirun -np 37 pw.x -i Pd2W2.in > Pd2W2.out &&
mpirun -np 37 pw.x -i Pd2Y2.in > Pd2Y2.out &&
mpirun -np 37 pw.x -i Rh2Pd2.in > Rh2Pd2.out &&
mpirun -np 37 pw.x -i Rh2W2.in > Rh2W2.out &&
mpirun -np 37 pw.x -i Ru2Pd2.in > Ru2Pd2.out &&
mpirun -np 37 pw.x -i Ru2W2.in > Ru2W2.out &&
mpirun -np 37 pw.x -i Sc2Pd2.in > Sc2Pd2.out &&
mpirun -np 37 pw.x -i Sc2V2.in > Sc2V2.out &&
mpirun -np 37 pw.x -i Sc2W2.in > Sc2W2.out &&
mpirun -np 37 pw.x -i Tc2Pd2.in > Tc2Pd2.out &&
mpirun -np 37 pw.x -i Tc2W2.in > Tc2W2.out &&
mpirun -np 37 pw.x -i Ti2Pd2.in > Ti2Pd2.out &&
mpirun -np 37 pw.x -i Ti2V2.in > Ti2V2.out &&
mpirun -np 37 pw.x -i Ti2W2.in > Ti2W2.out &&
mpirun -np 37 pw.x -i V2Ag2.in > V2Ag2.out &&
mpirun -np 37 pw.x -i V2Au2.in > V2Au2.out &&
mpirun -np 37 pw.x -i V2Cd2.in > V2Cd2.out &&
mpirun -np 37 pw.x -i V2Cr2.in > V2Cr2.out &&
mpirun -np 37 pw.x -i V2Cu2.in > V2Cu2.out &&
mpirun -np 37 pw.x -i V2Hg2.in > V2Hg2.out &&
mpirun -np 37 pw.x -i V2Ir2.in > V2Ir2.out &&
mpirun -np 37 pw.x -i V2Mo2.in > V2Mo2.out &&
mpirun -np 37 pw.x -i V2Nb2.in > V2Nb2.out &&
mpirun -np 37 pw.x -i V2Os2.in > V2Os2.out &&
mpirun -np 37 pw.x -i V2Pd2.in > V2Pd2.out &&
mpirun -np 37 pw.x -i V2Pt2.in > V2Pt2.out &&
mpirun -np 37 pw.x -i V2Re2.in > V2Re2.out &&
mpirun -np 37 pw.x -i V2Rh2.in > V2Rh2.out &&
mpirun -np 37 pw.x -i V2Ru2.in > V2Ru2.out &&
mpirun -np 37 pw.x -i V2Tc2.in > V2Tc2.out &&
mpirun -np 37 pw.x -i V2W2.in > V2W2.out &&
mpirun -np 37 pw.x -i V2Y2.in > V2Y2.out &&
mpirun -np 37 pw.x -i V2Zn2.in > V2Zn2.out &&
mpirun -np 37 pw.x -i V2Zr2.in > V2Zr2.out &&
mpirun -np 37 pw.x -i W2Au2.in > W2Au2.out &&
mpirun -np 37 pw.x -i W2Hg2.in > W2Hg2.out &&
mpirun -np 37 pw.x -i W2Ir2.in > W2Ir2.out &&
mpirun -np 37 pw.x -i W2Os2.in > W2Os2.out &&
mpirun -np 37 pw.x -i W2Pt2.in > W2Pt2.out &&
mpirun -np 37 pw.x -i W2Re2.in > W2Re2.out &&
mpirun -np 37 pw.x -i Y2W2.in > Y2W2.out &&
mpirun -np 37 pw.x -i Zn2Pd2.in > Zn2Pd2.out &&
mpirun -np 37 pw.x -i Zn2W2.in > Zn2W2.out &&
mpirun -np 37 pw.x -i Zr2Pd2.in > Zr2Pd2.out &&
mpirun -np 37 pw.x -i Zr2W2.in > Zr2W2.out
