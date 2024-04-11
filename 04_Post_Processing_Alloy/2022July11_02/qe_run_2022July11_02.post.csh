#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-02##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.02.out     ##CHANGE
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
pp.x      -i Ag2Ir2-pp.in > Ag2Ir2-pp.out &&
dos.x     -i Ag2Ir2-dos.in > Ag2Ir2-dos.out &&
average.x -i Ag2Ir2-wf.ave.in > Ag2Ir2-wf.ave.out &&
mv avg.dat Ag2Ir2-avg.dat &&
projwfc.x -i Ag2Ir2-pdos.in > Ag2Ir2-pdos.out &&
sleep 10

pp.x      -i Cd2Ir2-pp.in > Cd2Ir2-pp.out &&
dos.x     -i Cd2Ir2-dos.in > Cd2Ir2-dos.out &&
average.x -i Cd2Ir2-wf.ave.in > Cd2Ir2-wf.ave.out &&
mv avg.dat Cd2Ir2-avg.dat &&
projwfc.x -i Cd2Ir2-pdos.in > Cd2Ir2-pdos.out &&
sleep 10

pp.x      -i Cr2Ir2-pp.in > Cr2Ir2-pp.out &&
dos.x     -i Cr2Ir2-dos.in > Cr2Ir2-dos.out &&
average.x -i Cr2Ir2-wf.ave.in > Cr2Ir2-wf.ave.out &&
mv avg.dat Cr2Ir2-avg.dat &&
projwfc.x -i Cr2Ir2-pdos.in > Cr2Ir2-pdos.out &&
sleep 10

pp.x      -i Cr2Tc2-pp.in > Cr2Tc2-pp.out &&
dos.x     -i Cr2Tc2-dos.in > Cr2Tc2-dos.out &&
average.x -i Cr2Tc2-wf.ave.in > Cr2Tc2-wf.ave.out &&
mv avg.dat Cr2Tc2-avg.dat &&
projwfc.x -i Cr2Tc2-pdos.in > Cr2Tc2-pdos.out &&
sleep 10

pp.x      -i Cu2Ir2-pp.in > Cu2Ir2-pp.out &&
dos.x     -i Cu2Ir2-dos.in > Cu2Ir2-dos.out &&
average.x -i Cu2Ir2-wf.ave.in > Cu2Ir2-wf.ave.out &&
mv avg.dat Cu2Ir2-avg.dat &&
projwfc.x -i Cu2Ir2-pdos.in > Cu2Ir2-pdos.out &&
sleep 10

pp.x      -i Cu2Tc2-pp.in > Cu2Tc2-pp.out &&
dos.x     -i Cu2Tc2-dos.in > Cu2Tc2-dos.out &&
average.x -i Cu2Tc2-wf.ave.in > Cu2Tc2-wf.ave.out &&
mv avg.dat Cu2Tc2-avg.dat &&
projwfc.x -i Cu2Tc2-pdos.in > Cu2Tc2-pdos.out &&
sleep 10

pp.x      -i Ir2Au2-pp.in > Ir2Au2-pp.out &&
dos.x     -i Ir2Au2-dos.in > Ir2Au2-dos.out &&
average.x -i Ir2Au2-wf.ave.in > Ir2Au2-wf.ave.out &&
mv avg.dat Ir2Au2-avg.dat &&
projwfc.x -i Ir2Au2-pdos.in > Ir2Au2-pdos.out &&
sleep 10

pp.x      -i Ir2Hg2-pp.in > Ir2Hg2-pp.out &&
dos.x     -i Ir2Hg2-dos.in > Ir2Hg2-dos.out &&
average.x -i Ir2Hg2-wf.ave.in > Ir2Hg2-wf.ave.out &&
mv avg.dat Ir2Hg2-avg.dat &&
projwfc.x -i Ir2Hg2-pdos.in > Ir2Hg2-pdos.out &&
sleep 10

pp.x      -i Ir2Pt2-pp.in > Ir2Pt2-pp.out &&
dos.x     -i Ir2Pt2-dos.in > Ir2Pt2-dos.out &&
average.x -i Ir2Pt2-wf.ave.in > Ir2Pt2-wf.ave.out &&
mv avg.dat Ir2Pt2-avg.dat &&
projwfc.x -i Ir2Pt2-pdos.in > Ir2Pt2-pdos.out &&
sleep 10

pp.x      -i Mo2Ir2-pp.in > Mo2Ir2-pp.out &&
dos.x     -i Mo2Ir2-dos.in > Mo2Ir2-dos.out &&
average.x -i Mo2Ir2-wf.ave.in > Mo2Ir2-wf.ave.out &&
mv avg.dat Mo2Ir2-avg.dat &&
projwfc.x -i Mo2Ir2-pdos.in > Mo2Ir2-pdos.out &&
sleep 10

pp.x      -i Mo2Tc2-pp.in > Mo2Tc2-pp.out &&
dos.x     -i Mo2Tc2-dos.in > Mo2Tc2-dos.out &&
average.x -i Mo2Tc2-wf.ave.in > Mo2Tc2-wf.ave.out &&
mv avg.dat Mo2Tc2-avg.dat &&
projwfc.x -i Mo2Tc2-pdos.in > Mo2Tc2-pdos.out &&
sleep 10

pp.x      -i Nb2Ir2-pp.in > Nb2Ir2-pp.out &&
dos.x     -i Nb2Ir2-dos.in > Nb2Ir2-dos.out &&
average.x -i Nb2Ir2-wf.ave.in > Nb2Ir2-wf.ave.out &&
mv avg.dat Nb2Ir2-avg.dat &&
projwfc.x -i Nb2Ir2-pdos.in > Nb2Ir2-pdos.out &&
sleep 10

pp.x      -i Nb2Tc2-pp.in > Nb2Tc2-pp.out &&
dos.x     -i Nb2Tc2-dos.in > Nb2Tc2-dos.out &&
average.x -i Nb2Tc2-wf.ave.in > Nb2Tc2-wf.ave.out &&
mv avg.dat Nb2Tc2-avg.dat &&
projwfc.x -i Nb2Tc2-pdos.in > Nb2Tc2-pdos.out &&
sleep 10

pp.x      -i Os2Ir2-pp.in > Os2Ir2-pp.out &&
dos.x     -i Os2Ir2-dos.in > Os2Ir2-dos.out &&
average.x -i Os2Ir2-wf.ave.in > Os2Ir2-wf.ave.out &&
mv avg.dat Os2Ir2-avg.dat &&
projwfc.x -i Os2Ir2-pdos.in > Os2Ir2-pdos.out &&
sleep 10

pp.x      -i Re2Ir2-pp.in > Re2Ir2-pp.out &&
dos.x     -i Re2Ir2-dos.in > Re2Ir2-dos.out &&
average.x -i Re2Ir2-wf.ave.in > Re2Ir2-wf.ave.out &&
mv avg.dat Re2Ir2-avg.dat &&
projwfc.x -i Re2Ir2-pdos.in > Re2Ir2-pdos.out &&
sleep 10

pp.x      -i Rh2Ir2-pp.in > Rh2Ir2-pp.out &&
dos.x     -i Rh2Ir2-dos.in > Rh2Ir2-dos.out &&
average.x -i Rh2Ir2-wf.ave.in > Rh2Ir2-wf.ave.out &&
mv avg.dat Rh2Ir2-avg.dat &&
projwfc.x -i Rh2Ir2-pdos.in > Rh2Ir2-pdos.out &&
sleep 10

pp.x      -i Ru2Ir2-pp.in > Ru2Ir2-pp.out &&
dos.x     -i Ru2Ir2-dos.in > Ru2Ir2-dos.out &&
average.x -i Ru2Ir2-wf.ave.in > Ru2Ir2-wf.ave.out &&
mv avg.dat Ru2Ir2-avg.dat &&
projwfc.x -i Ru2Ir2-pdos.in > Ru2Ir2-pdos.out &&
sleep 10

pp.x      -i Sc2Ir2-pp.in > Sc2Ir2-pp.out &&
dos.x     -i Sc2Ir2-dos.in > Sc2Ir2-dos.out &&
average.x -i Sc2Ir2-wf.ave.in > Sc2Ir2-wf.ave.out &&
mv avg.dat Sc2Ir2-avg.dat &&
projwfc.x -i Sc2Ir2-pdos.in > Sc2Ir2-pdos.out &&
sleep 10

pp.x      -i Sc2Tc2-pp.in > Sc2Tc2-pp.out &&
dos.x     -i Sc2Tc2-dos.in > Sc2Tc2-dos.out &&
average.x -i Sc2Tc2-wf.ave.in > Sc2Tc2-wf.ave.out &&
mv avg.dat Sc2Tc2-avg.dat &&
projwfc.x -i Sc2Tc2-pdos.in > Sc2Tc2-pdos.out &&
sleep 10

pp.x      -i Tc2Ag2-pp.in > Tc2Ag2-pp.out &&
dos.x     -i Tc2Ag2-dos.in > Tc2Ag2-dos.out &&
average.x -i Tc2Ag2-wf.ave.in > Tc2Ag2-wf.ave.out &&
mv avg.dat Tc2Ag2-avg.dat &&
projwfc.x -i Tc2Ag2-pdos.in > Tc2Ag2-pdos.out &&
sleep 10

pp.x      -i Tc2Au2-pp.in > Tc2Au2-pp.out &&
dos.x     -i Tc2Au2-dos.in > Tc2Au2-dos.out &&
average.x -i Tc2Au2-wf.ave.in > Tc2Au2-wf.ave.out &&
mv avg.dat Tc2Au2-avg.dat &&
projwfc.x -i Tc2Au2-pdos.in > Tc2Au2-pdos.out &&
sleep 10

pp.x      -i Tc2Cd2-pp.in > Tc2Cd2-pp.out &&
dos.x     -i Tc2Cd2-dos.in > Tc2Cd2-dos.out &&
average.x -i Tc2Cd2-wf.ave.in > Tc2Cd2-wf.ave.out &&
mv avg.dat Tc2Cd2-avg.dat &&
projwfc.x -i Tc2Cd2-pdos.in > Tc2Cd2-pdos.out &&
sleep 10

pp.x      -i Tc2Hg2-pp.in > Tc2Hg2-pp.out &&
dos.x     -i Tc2Hg2-dos.in > Tc2Hg2-dos.out &&
average.x -i Tc2Hg2-wf.ave.in > Tc2Hg2-wf.ave.out &&
mv avg.dat Tc2Hg2-avg.dat &&
projwfc.x -i Tc2Hg2-pdos.in > Tc2Hg2-pdos.out &&
sleep 10

pp.x      -i Tc2Ir2-pp.in > Tc2Ir2-pp.out &&
dos.x     -i Tc2Ir2-dos.in > Tc2Ir2-dos.out &&
average.x -i Tc2Ir2-wf.ave.in > Tc2Ir2-wf.ave.out &&
mv avg.dat Tc2Ir2-avg.dat &&
projwfc.x -i Tc2Ir2-pdos.in > Tc2Ir2-pdos.out &&
sleep 10

pp.x      -i Tc2Os2-pp.in > Tc2Os2-pp.out &&
dos.x     -i Tc2Os2-dos.in > Tc2Os2-dos.out &&
average.x -i Tc2Os2-wf.ave.in > Tc2Os2-wf.ave.out &&
mv avg.dat Tc2Os2-avg.dat &&
projwfc.x -i Tc2Os2-pdos.in > Tc2Os2-pdos.out &&
sleep 10

pp.x      -i Tc2Pt2-pp.in > Tc2Pt2-pp.out &&
dos.x     -i Tc2Pt2-dos.in > Tc2Pt2-dos.out &&
average.x -i Tc2Pt2-wf.ave.in > Tc2Pt2-wf.ave.out &&
mv avg.dat Tc2Pt2-avg.dat &&
projwfc.x -i Tc2Pt2-pdos.in > Tc2Pt2-pdos.out &&
sleep 10

pp.x      -i Tc2Re2-pp.in > Tc2Re2-pp.out &&
dos.x     -i Tc2Re2-dos.in > Tc2Re2-dos.out &&
average.x -i Tc2Re2-wf.ave.in > Tc2Re2-wf.ave.out &&
mv avg.dat Tc2Re2-avg.dat &&
projwfc.x -i Tc2Re2-pdos.in > Tc2Re2-pdos.out &&
sleep 10

pp.x      -i Tc2Rh2-pp.in > Tc2Rh2-pp.out &&
dos.x     -i Tc2Rh2-dos.in > Tc2Rh2-dos.out &&
average.x -i Tc2Rh2-wf.ave.in > Tc2Rh2-wf.ave.out &&
mv avg.dat Tc2Rh2-avg.dat &&
projwfc.x -i Tc2Rh2-pdos.in > Tc2Rh2-pdos.out &&
sleep 10

pp.x      -i Tc2Ru2-pp.in > Tc2Ru2-pp.out &&
dos.x     -i Tc2Ru2-dos.in > Tc2Ru2-dos.out &&
average.x -i Tc2Ru2-wf.ave.in > Tc2Ru2-wf.ave.out &&
mv avg.dat Tc2Ru2-avg.dat &&
projwfc.x -i Tc2Ru2-pdos.in > Tc2Ru2-pdos.out &&
sleep 10

pp.x      -i Tc2Y2-pp.in > Tc2Y2-pp.out &&
dos.x     -i Tc2Y2-dos.in > Tc2Y2-dos.out &&
average.x -i Tc2Y2-wf.ave.in > Tc2Y2-wf.ave.out &&
mv avg.dat Tc2Y2-avg.dat &&
projwfc.x -i Tc2Y2-pdos.in > Tc2Y2-pdos.out &&
sleep 10

pp.x      -i Ti2Ir2-pp.in > Ti2Ir2-pp.out &&
dos.x     -i Ti2Ir2-dos.in > Ti2Ir2-dos.out &&
average.x -i Ti2Ir2-wf.ave.in > Ti2Ir2-wf.ave.out &&
mv avg.dat Ti2Ir2-avg.dat &&
projwfc.x -i Ti2Ir2-pdos.in > Ti2Ir2-pdos.out &&
sleep 10

pp.x      -i Ti2Tc2-pp.in > Ti2Tc2-pp.out &&
dos.x     -i Ti2Tc2-dos.in > Ti2Tc2-dos.out &&
average.x -i Ti2Tc2-wf.ave.in > Ti2Tc2-wf.ave.out &&
mv avg.dat Ti2Tc2-avg.dat &&
projwfc.x -i Ti2Tc2-pdos.in > Ti2Tc2-pdos.out &&
sleep 10

pp.x      -i Y2Ir2-pp.in > Y2Ir2-pp.out &&
dos.x     -i Y2Ir2-dos.in > Y2Ir2-dos.out &&
average.x -i Y2Ir2-wf.ave.in > Y2Ir2-wf.ave.out &&
mv avg.dat Y2Ir2-avg.dat &&
projwfc.x -i Y2Ir2-pdos.in > Y2Ir2-pdos.out &&
sleep 10

pp.x      -i Zr2Ir2-pp.in > Zr2Ir2-pp.out &&
dos.x     -i Zr2Ir2-dos.in > Zr2Ir2-dos.out &&
average.x -i Zr2Ir2-wf.ave.in > Zr2Ir2-wf.ave.out &&
mv avg.dat Zr2Ir2-avg.dat &&
projwfc.x -i Zr2Ir2-pdos.in > Zr2Ir2-pdos.out &&
sleep 10

pp.x      -i Zr2Tc2-pp.in > Zr2Tc2-pp.out &&
dos.x     -i Zr2Tc2-dos.in > Zr2Tc2-dos.out &&
average.x -i Zr2Tc2-wf.ave.in > Zr2Tc2-wf.ave.out &&
mv avg.dat Zr2Tc2-avg.dat &&
projwfc.x -i Zr2Tc2-pdos.in > Zr2Tc2-pdos.out &&
sleep 10

