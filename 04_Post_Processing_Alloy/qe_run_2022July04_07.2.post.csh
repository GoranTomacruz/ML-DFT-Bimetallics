./2022July04_07/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-07.2-##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.07.out     ##CHANGE
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
module load anaconda/3-2021.11

ulimit -s unlimited

export OMP_NUM_THREADS=1

##cd to working directory
pp.x      -i Ag2Hf2-pp.in &&
dos.x     -i Ag2Hf2-dos.in &&
average.x -i Ag2Hf2-wf.ave.in > Ag2Hf2-wf.ave.out &&
mv avg.dat Ag2Hf2-avg.dat &&
sleep 10

projwfc.x -i Ag2Hf2-pdos.in &&
sleep 5

pp.x      -i Ag2Ta2-pp.in &&
dos.x     -i Ag2Ta2-dos.in &&
average.x -i Ag2Ta2-wf.ave.in > Ag2Ta2-wf.ave.out &&
mv avg.dat Ag2Ta2-avg.dat &&
sleep 10

projwfc.x -i Ag2Ta2-pdos.in &&
sleep 5

pp.x      -i Cd2Hf2-pp.in &&
dos.x     -i Cd2Hf2-dos.in &&
average.x -i Cd2Hf2-wf.ave.in > Cd2Hf2-wf.ave.out &&
mv avg.dat Cd2Hf2-avg.dat &&
sleep 10

projwfc.x -i Cd2Hf2-pdos.in &&
sleep 5

pp.x      -i Cd2Ta2-pp.in &&
dos.x     -i Cd2Ta2-dos.in &&
average.x -i Cd2Ta2-wf.ave.in > Cd2Ta2-wf.ave.out &&
mv avg.dat Cd2Ta2-avg.dat &&
sleep 10

projwfc.x -i Cd2Ta2-pdos.in &&
sleep 5

pp.x      -i Cr2Hf2-pp.in &&
dos.x     -i Cr2Hf2-dos.in &&
average.x -i Cr2Hf2-wf.ave.in > Cr2Hf2-wf.ave.out &&
mv avg.dat Cr2Hf2-avg.dat &&
sleep 10

projwfc.x -i Cr2Hf2-pdos.in &&
sleep 5

pp.x      -i Cr2Ta2-pp.in &&
dos.x     -i Cr2Ta2-dos.in &&
average.x -i Cr2Ta2-wf.ave.in > Cr2Ta2-wf.ave.out &&
mv avg.dat Cr2Ta2-avg.dat &&
sleep 10

projwfc.x -i Cr2Ta2-pdos.in &&
sleep 5

pp.x      -i Cu2Hf2-pp.in &&
dos.x     -i Cu2Hf2-dos.in &&
average.x -i Cu2Hf2-wf.ave.in > Cu2Hf2-wf.ave.out &&
mv avg.dat Cu2Hf2-avg.dat &&
sleep 10

projwfc.x -i Cu2Hf2-pdos.in &&
sleep 5

pp.x      -i Cu2Ta2-pp.in &&
dos.x     -i Cu2Ta2-dos.in &&
average.x -i Cu2Ta2-wf.ave.in > Cu2Ta2-wf.ave.out &&
mv avg.dat Cu2Ta2-avg.dat &&
sleep 10

projwfc.x -i Cu2Ta2-pdos.in &&
sleep 5

pp.x      -i Hf2Au2-pp.in &&
dos.x     -i Hf2Au2-dos.in &&
average.x -i Hf2Au2-wf.ave.in > Hf2Au2-wf.ave.out &&
mv avg.dat Hf2Au2-avg.dat &&
sleep 10

projwfc.x -i Hf2Au2-pdos.in &&
sleep 5

pp.x      -i Hf2Hg2-pp.in &&
dos.x     -i Hf2Hg2-dos.in &&
average.x -i Hf2Hg2-wf.ave.in > Hf2Hg2-wf.ave.out &&
mv avg.dat Hf2Hg2-avg.dat &&
sleep 10

projwfc.x -i Hf2Hg2-pdos.in &&
sleep 5

pp.x      -i Hf2Ir2-pp.in &&
dos.x     -i Hf2Ir2-dos.in &&
average.x -i Hf2Ir2-wf.ave.in > Hf2Ir2-wf.ave.out &&
mv avg.dat Hf2Ir2-avg.dat &&
sleep 10

projwfc.x -i Hf2Ir2-pdos.in &&
sleep 5

pp.x      -i Hf2Os2-pp.in &&
dos.x     -i Hf2Os2-dos.in &&
average.x -i Hf2Os2-wf.ave.in > Hf2Os2-wf.ave.out &&
mv avg.dat Hf2Os2-avg.dat &&
sleep 10

projwfc.x -i Hf2Os2-pdos.in &&
sleep 5

pp.x      -i Hf2Pt2-pp.in &&
dos.x     -i Hf2Pt2-dos.in &&
average.x -i Hf2Pt2-wf.ave.in > Hf2Pt2-wf.ave.out &&
mv avg.dat Hf2Pt2-avg.dat &&
sleep 10

projwfc.x -i Hf2Pt2-pdos.in &&
sleep 5

pp.x      -i Hf2Re2-pp.in &&
dos.x     -i Hf2Re2-dos.in &&
average.x -i Hf2Re2-wf.ave.in > Hf2Re2-wf.ave.out &&
mv avg.dat Hf2Re2-avg.dat &&
sleep 10

projwfc.x -i Hf2Re2-pdos.in &&
sleep 5

pp.x      -i Hf2Ta2-pp.in &&
dos.x     -i Hf2Ta2-dos.in &&
average.x -i Hf2Ta2-wf.ave.in > Hf2Ta2-wf.ave.out &&
mv avg.dat Hf2Ta2-avg.dat &&
sleep 10

projwfc.x -i Hf2Ta2-pdos.in &&
sleep 5

pp.x      -i Hf2W2-pp.in &&
dos.x     -i Hf2W2-dos.in &&
average.x -i Hf2W2-wf.ave.in > Hf2W2-wf.ave.out &&
mv avg.dat Hf2W2-avg.dat &&
sleep 10

projwfc.x -i Hf2W2-pdos.in &&
sleep 5

pp.x      -i Hf2Y2-pp.in &&
dos.x     -i Hf2Y2-dos.in &&
average.x -i Hf2Y2-wf.ave.in > Hf2Y2-wf.ave.out &&
mv avg.dat Hf2Y2-avg.dat &&
sleep 10

projwfc.x -i Hf2Y2-pdos.in &&
sleep 5

pp.x      -i Mo2Hf2-pp.in &&
dos.x     -i Mo2Hf2-dos.in &&
average.x -i Mo2Hf2-wf.ave.in > Mo2Hf2-wf.ave.out &&
mv avg.dat Mo2Hf2-avg.dat &&
sleep 10

projwfc.x -i Mo2Hf2-pdos.in &&
sleep 5

pp.x      -i Mo2Ta2-pp.in &&
dos.x     -i Mo2Ta2-dos.in &&
average.x -i Mo2Ta2-wf.ave.in > Mo2Ta2-wf.ave.out &&
mv avg.dat Mo2Ta2-avg.dat &&
sleep 10

projwfc.x -i Mo2Ta2-pdos.in &&
sleep 5

pp.x      -i Nb2Hf2-pp.in &&
dos.x     -i Nb2Hf2-dos.in &&
average.x -i Nb2Hf2-wf.ave.in > Nb2Hf2-wf.ave.out &&
mv avg.dat Nb2Hf2-avg.dat &&
sleep 10

projwfc.x -i Nb2Hf2-pdos.in &&
sleep 5

pp.x      -i Nb2Ta2-pp.in &&
dos.x     -i Nb2Ta2-dos.in &&
average.x -i Nb2Ta2-wf.ave.in > Nb2Ta2-wf.ave.out &&
mv avg.dat Nb2Ta2-avg.dat &&
sleep 10

projwfc.x -i Nb2Ta2-pdos.in &&
sleep 5

pp.x      -i Pd2Hf2-pp.in &&
dos.x     -i Pd2Hf2-dos.in &&
average.x -i Pd2Hf2-wf.ave.in > Pd2Hf2-wf.ave.out &&
mv avg.dat Pd2Hf2-avg.dat &&
sleep 10

projwfc.x -i Pd2Hf2-pdos.in &&
sleep 5

pp.x      -i Pd2Ta2-pp.in &&
dos.x     -i Pd2Ta2-dos.in &&
average.x -i Pd2Ta2-wf.ave.in > Pd2Ta2-wf.ave.out &&
mv avg.dat Pd2Ta2-avg.dat &&
sleep 10

projwfc.x -i Pd2Ta2-pdos.in &&
sleep 5

pp.x      -i Rh2Hf2-pp.in &&
dos.x     -i Rh2Hf2-dos.in &&
average.x -i Rh2Hf2-wf.ave.in > Rh2Hf2-wf.ave.out &&
mv avg.dat Rh2Hf2-avg.dat &&
sleep 10

projwfc.x -i Rh2Hf2-pdos.in &&
sleep 5

pp.x      -i Rh2Ta2-pp.in &&
dos.x     -i Rh2Ta2-dos.in &&
average.x -i Rh2Ta2-wf.ave.in > Rh2Ta2-wf.ave.out &&
mv avg.dat Rh2Ta2-avg.dat &&
sleep 10

projwfc.x -i Rh2Ta2-pdos.in &&
sleep 5

pp.x      -i Ru2Hf2-pp.in &&
dos.x     -i Ru2Hf2-dos.in &&
average.x -i Ru2Hf2-wf.ave.in > Ru2Hf2-wf.ave.out &&
mv avg.dat Ru2Hf2-avg.dat &&
sleep 10

projwfc.x -i Ru2Hf2-pdos.in &&
sleep 5

pp.x      -i Ru2Ta2-pp.in &&
dos.x     -i Ru2Ta2-dos.in &&
average.x -i Ru2Ta2-wf.ave.in > Ru2Ta2-wf.ave.out &&
mv avg.dat Ru2Ta2-avg.dat &&
sleep 10

projwfc.x -i Ru2Ta2-pdos.in &&
sleep 5

pp.x      -i Sc2Hf2-pp.in &&
dos.x     -i Sc2Hf2-dos.in &&
average.x -i Sc2Hf2-wf.ave.in > Sc2Hf2-wf.ave.out &&
mv avg.dat Sc2Hf2-avg.dat &&
sleep 10

projwfc.x -i Sc2Hf2-pdos.in &&
sleep 5

pp.x      -i Sc2Ta2-pp.in &&
dos.x     -i Sc2Ta2-dos.in &&
average.x -i Sc2Ta2-wf.ave.in > Sc2Ta2-wf.ave.out &&
mv avg.dat Sc2Ta2-avg.dat &&
sleep 10

projwfc.x -i Sc2Ta2-pdos.in &&
sleep 5

pp.x      -i Ta2Au2-pp.in &&
dos.x     -i Ta2Au2-dos.in &&
average.x -i Ta2Au2-wf.ave.in > Ta2Au2-wf.ave.out &&
mv avg.dat Ta2Au2-avg.dat &&
sleep 10

projwfc.x -i Ta2Au2-pdos.in &&
sleep 5

pp.x      -i Ta2Hg2-pp.in &&
dos.x     -i Ta2Hg2-dos.in &&
average.x -i Ta2Hg2-wf.ave.in > Ta2Hg2-wf.ave.out &&
mv avg.dat Ta2Hg2-avg.dat &&
sleep 10

projwfc.x -i Ta2Hg2-pdos.in &&
sleep 5

pp.x      -i Ta2Ir2-pp.in &&
dos.x     -i Ta2Ir2-dos.in &&
average.x -i Ta2Ir2-wf.ave.in > Ta2Ir2-wf.ave.out &&
mv avg.dat Ta2Ir2-avg.dat &&
sleep 10

projwfc.x -i Ta2Ir2-pdos.in &&
sleep 5

pp.x      -i Ta2Os2-pp.in &&
dos.x     -i Ta2Os2-dos.in &&
average.x -i Ta2Os2-wf.ave.in > Ta2Os2-wf.ave.out &&
mv avg.dat Ta2Os2-avg.dat &&
sleep 10

projwfc.x -i Ta2Os2-pdos.in &&
sleep 5

pp.x      -i Ta2Pt2-pp.in &&
dos.x     -i Ta2Pt2-dos.in &&
average.x -i Ta2Pt2-wf.ave.in > Ta2Pt2-wf.ave.out &&
mv avg.dat Ta2Pt2-avg.dat &&
sleep 10

projwfc.x -i Ta2Pt2-pdos.in &&
sleep 5

pp.x      -i Ta2Re2-pp.in &&
dos.x     -i Ta2Re2-dos.in &&
average.x -i Ta2Re2-wf.ave.in > Ta2Re2-wf.ave.out &&
mv avg.dat Ta2Re2-avg.dat &&
sleep 10

projwfc.x -i Ta2Re2-pdos.in &&
sleep 5

pp.x      -i Ta2W2-pp.in &&
dos.x     -i Ta2W2-dos.in &&
average.x -i Ta2W2-wf.ave.in > Ta2W2-wf.ave.out &&
mv avg.dat Ta2W2-avg.dat &&
sleep 10

projwfc.x -i Ta2W2-pdos.in &&
sleep 5

pp.x      -i Tc2Hf2-pp.in &&
dos.x     -i Tc2Hf2-dos.in &&
average.x -i Tc2Hf2-wf.ave.in > Tc2Hf2-wf.ave.out &&
mv avg.dat Tc2Hf2-avg.dat &&
sleep 10

projwfc.x -i Tc2Hf2-pdos.in &&
sleep 5

pp.x      -i Tc2Ta2-pp.in &&
dos.x     -i Tc2Ta2-dos.in &&
average.x -i Tc2Ta2-wf.ave.in > Tc2Ta2-wf.ave.out &&
mv avg.dat Tc2Ta2-avg.dat &&
sleep 10

projwfc.x -i Tc2Ta2-pdos.in &&
sleep 5

pp.x      -i Ti2Hf2-pp.in &&
dos.x     -i Ti2Hf2-dos.in &&
average.x -i Ti2Hf2-wf.ave.in > Ti2Hf2-wf.ave.out &&
mv avg.dat Ti2Hf2-avg.dat &&
sleep 10

projwfc.x -i Ti2Hf2-pdos.in &&
sleep 5

pp.x      -i Ti2Ta2-pp.in &&
dos.x     -i Ti2Ta2-dos.in &&
average.x -i Ti2Ta2-wf.ave.in > Ti2Ta2-wf.ave.out &&
mv avg.dat Ti2Ta2-avg.dat &&
sleep 10

projwfc.x -i Ti2Ta2-pdos.in &&
sleep 5

pp.x      -i V2Hf2-pp.in &&
dos.x     -i V2Hf2-dos.in &&
average.x -i V2Hf2-wf.ave.in > V2Hf2-wf.ave.out &&
mv avg.dat V2Hf2-avg.dat &&
sleep 10

projwfc.x -i V2Hf2-pdos.in &&
sleep 5

pp.x      -i V2Ta2-pp.in &&
dos.x     -i V2Ta2-dos.in &&
average.x -i V2Ta2-wf.ave.in > V2Ta2-wf.ave.out &&
mv avg.dat V2Ta2-avg.dat &&
sleep 10

projwfc.x -i V2Ta2-pdos.in &&
sleep 5

pp.x      -i Y2Ta2-pp.in &&
dos.x     -i Y2Ta2-dos.in &&
average.x -i Y2Ta2-wf.ave.in > Y2Ta2-wf.ave.out &&
mv avg.dat Y2Ta2-avg.dat &&
sleep 10

projwfc.x -i Y2Ta2-pdos.in &&
sleep 5

pp.x      -i Zn2Hf2-pp.in &&
dos.x     -i Zn2Hf2-dos.in &&
average.x -i Zn2Hf2-wf.ave.in > Zn2Hf2-wf.ave.out &&
mv avg.dat Zn2Hf2-avg.dat &&
sleep 10

projwfc.x -i Zn2Hf2-pdos.in &&
sleep 5

pp.x      -i Zn2Ta2-pp.in &&
dos.x     -i Zn2Ta2-dos.in &&
average.x -i Zn2Ta2-wf.ave.in > Zn2Ta2-wf.ave.out &&
mv avg.dat Zn2Ta2-avg.dat &&
sleep 10

projwfc.x -i Zn2Ta2-pdos.in &&
sleep 5

pp.x      -i Zr2Hf2-pp.in &&
dos.x     -i Zr2Hf2-dos.in &&
average.x -i Zr2Hf2-wf.ave.in > Zr2Hf2-wf.ave.out &&
mv avg.dat Zr2Hf2-avg.dat &&
sleep 10

projwfc.x -i Zr2Hf2-pdos.in &&
sleep 5

pp.x      -i Zr2Ta2-pp.in &&
dos.x     -i Zr2Ta2-dos.in &&
average.x -i Zr2Ta2-wf.ave.in > Zr2Ta2-wf.ave.out &&
mv avg.dat Zr2Ta2-avg.dat &&
sleep 10

projwfc.x -i Zr2Ta2-pdos.in &&
sleep 5

