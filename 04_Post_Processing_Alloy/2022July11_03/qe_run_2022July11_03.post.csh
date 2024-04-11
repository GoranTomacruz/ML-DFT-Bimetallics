#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-03##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.03.out     ##CHANGE
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
pp.x      -i Ag2Pt2-pp.in > Ag2Pt2-pp.out &&
dos.x     -i Ag2Pt2-dos.in > Ag2Pt2-dos.out &&
average.x -i Ag2Pt2-wf.ave.in > Ag2Pt2-wf.ave.out &&
mv avg.dat Ag2Pt2-avg.dat &&
projwfc.x -i Ag2Pt2-pdos.in > Ag2Pt2-pdos.out &&
sleep 10

pp.x      -i Ag2Re2-pp.in > Ag2Re2-pp.out &&
dos.x     -i Ag2Re2-dos.in > Ag2Re2-dos.out &&
average.x -i Ag2Re2-wf.ave.in > Ag2Re2-wf.ave.out &&
mv avg.dat Ag2Re2-avg.dat &&
projwfc.x -i Ag2Re2-pdos.in > Ag2Re2-pdos.out &&
sleep 10

pp.x      -i Cd2Pt2-pp.in > Cd2Pt2-pp.out &&
dos.x     -i Cd2Pt2-dos.in > Cd2Pt2-dos.out &&
average.x -i Cd2Pt2-wf.ave.in > Cd2Pt2-wf.ave.out &&
mv avg.dat Cd2Pt2-avg.dat &&
projwfc.x -i Cd2Pt2-pdos.in > Cd2Pt2-pdos.out &&
sleep 10

pp.x      -i Cd2Re2-pp.in > Cd2Re2-pp.out &&
dos.x     -i Cd2Re2-dos.in > Cd2Re2-dos.out &&
average.x -i Cd2Re2-wf.ave.in > Cd2Re2-wf.ave.out &&
mv avg.dat Cd2Re2-avg.dat &&
projwfc.x -i Cd2Re2-pdos.in > Cd2Re2-pdos.out &&
sleep 10

pp.x      -i Cr2Pt2-pp.in > Cr2Pt2-pp.out &&
dos.x     -i Cr2Pt2-dos.in > Cr2Pt2-dos.out &&
average.x -i Cr2Pt2-wf.ave.in > Cr2Pt2-wf.ave.out &&
mv avg.dat Cr2Pt2-avg.dat &&
projwfc.x -i Cr2Pt2-pdos.in > Cr2Pt2-pdos.out &&
sleep 10

pp.x      -i Cr2Re2-pp.in > Cr2Re2-pp.out &&
dos.x     -i Cr2Re2-dos.in > Cr2Re2-dos.out &&
average.x -i Cr2Re2-wf.ave.in > Cr2Re2-wf.ave.out &&
mv avg.dat Cr2Re2-avg.dat &&
projwfc.x -i Cr2Re2-pdos.in > Cr2Re2-pdos.out &&
sleep 10

pp.x      -i Cu2Pt2-pp.in > Cu2Pt2-pp.out &&
dos.x     -i Cu2Pt2-dos.in > Cu2Pt2-dos.out &&
average.x -i Cu2Pt2-wf.ave.in > Cu2Pt2-wf.ave.out &&
mv avg.dat Cu2Pt2-avg.dat &&
projwfc.x -i Cu2Pt2-pdos.in > Cu2Pt2-pdos.out &&
sleep 10

pp.x      -i Cu2Re2-pp.in > Cu2Re2-pp.out &&
dos.x     -i Cu2Re2-dos.in > Cu2Re2-dos.out &&
average.x -i Cu2Re2-wf.ave.in > Cu2Re2-wf.ave.out &&
mv avg.dat Cu2Re2-avg.dat &&
projwfc.x -i Cu2Re2-pdos.in > Cu2Re2-pdos.out &&
sleep 10

pp.x      -i Mo2Pt2-pp.in > Mo2Pt2-pp.out &&
dos.x     -i Mo2Pt2-dos.in > Mo2Pt2-dos.out &&
average.x -i Mo2Pt2-wf.ave.in > Mo2Pt2-wf.ave.out &&
mv avg.dat Mo2Pt2-avg.dat &&
projwfc.x -i Mo2Pt2-pdos.in > Mo2Pt2-pdos.out &&
sleep 10

pp.x      -i Mo2Re2-pp.in > Mo2Re2-pp.out &&
dos.x     -i Mo2Re2-dos.in > Mo2Re2-dos.out &&
average.x -i Mo2Re2-wf.ave.in > Mo2Re2-wf.ave.out &&
mv avg.dat Mo2Re2-avg.dat &&
projwfc.x -i Mo2Re2-pdos.in > Mo2Re2-pdos.out &&
sleep 10

pp.x      -i Nb2Pt2-pp.in > Nb2Pt2-pp.out &&
dos.x     -i Nb2Pt2-dos.in > Nb2Pt2-dos.out &&
average.x -i Nb2Pt2-wf.ave.in > Nb2Pt2-wf.ave.out &&
mv avg.dat Nb2Pt2-avg.dat &&
projwfc.x -i Nb2Pt2-pdos.in > Nb2Pt2-pdos.out &&
sleep 10

pp.x      -i Nb2Re2-pp.in > Nb2Re2-pp.out &&
dos.x     -i Nb2Re2-dos.in > Nb2Re2-dos.out &&
average.x -i Nb2Re2-wf.ave.in > Nb2Re2-wf.ave.out &&
mv avg.dat Nb2Re2-avg.dat &&
projwfc.x -i Nb2Re2-pdos.in > Nb2Re2-pdos.out &&
sleep 10

pp.x      -i Os2Pt2-pp.in > Os2Pt2-pp.out &&
dos.x     -i Os2Pt2-dos.in > Os2Pt2-dos.out &&
average.x -i Os2Pt2-wf.ave.in > Os2Pt2-wf.ave.out &&
mv avg.dat Os2Pt2-avg.dat &&
projwfc.x -i Os2Pt2-pdos.in > Os2Pt2-pdos.out &&
sleep 10

pp.x      -i Pt2Au2-pp.in > Pt2Au2-pp.out &&
dos.x     -i Pt2Au2-dos.in > Pt2Au2-dos.out &&
average.x -i Pt2Au2-wf.ave.in > Pt2Au2-wf.ave.out &&
mv avg.dat Pt2Au2-avg.dat &&
projwfc.x -i Pt2Au2-pdos.in > Pt2Au2-pdos.out &&
sleep 10

pp.x      -i Pt2Hg2-pp.in > Pt2Hg2-pp.out &&
dos.x     -i Pt2Hg2-dos.in > Pt2Hg2-dos.out &&
average.x -i Pt2Hg2-wf.ave.in > Pt2Hg2-wf.ave.out &&
mv avg.dat Pt2Hg2-avg.dat &&
projwfc.x -i Pt2Hg2-pdos.in > Pt2Hg2-pdos.out &&
sleep 10

pp.x      -i Re2Au2-pp.in > Re2Au2-pp.out &&
dos.x     -i Re2Au2-dos.in > Re2Au2-dos.out &&
average.x -i Re2Au2-wf.ave.in > Re2Au2-wf.ave.out &&
mv avg.dat Re2Au2-avg.dat &&
projwfc.x -i Re2Au2-pdos.in > Re2Au2-pdos.out &&
sleep 10

pp.x      -i Re2Hg2-pp.in > Re2Hg2-pp.out &&
dos.x     -i Re2Hg2-dos.in > Re2Hg2-dos.out &&
average.x -i Re2Hg2-wf.ave.in > Re2Hg2-wf.ave.out &&
mv avg.dat Re2Hg2-avg.dat &&
projwfc.x -i Re2Hg2-pdos.in > Re2Hg2-pdos.out &&
sleep 10

pp.x      -i Re2Os2-pp.in > Re2Os2-pp.out &&
dos.x     -i Re2Os2-dos.in > Re2Os2-dos.out &&
average.x -i Re2Os2-wf.ave.in > Re2Os2-wf.ave.out &&
mv avg.dat Re2Os2-avg.dat &&
projwfc.x -i Re2Os2-pdos.in > Re2Os2-pdos.out &&
sleep 10

pp.x      -i Re2Pt2-pp.in > Re2Pt2-pp.out &&
dos.x     -i Re2Pt2-dos.in > Re2Pt2-dos.out &&
average.x -i Re2Pt2-wf.ave.in > Re2Pt2-wf.ave.out &&
mv avg.dat Re2Pt2-avg.dat &&
projwfc.x -i Re2Pt2-pdos.in > Re2Pt2-pdos.out &&
sleep 10

pp.x      -i Rh2Pt2-pp.in > Rh2Pt2-pp.out &&
dos.x     -i Rh2Pt2-dos.in > Rh2Pt2-dos.out &&
average.x -i Rh2Pt2-wf.ave.in > Rh2Pt2-wf.ave.out &&
mv avg.dat Rh2Pt2-avg.dat &&
projwfc.x -i Rh2Pt2-pdos.in > Rh2Pt2-pdos.out &&
sleep 10

pp.x      -i Rh2Re2-pp.in > Rh2Re2-pp.out &&
dos.x     -i Rh2Re2-dos.in > Rh2Re2-dos.out &&
average.x -i Rh2Re2-wf.ave.in > Rh2Re2-wf.ave.out &&
mv avg.dat Rh2Re2-avg.dat &&
projwfc.x -i Rh2Re2-pdos.in > Rh2Re2-pdos.out &&
sleep 10

pp.x      -i Ru2Pt2-pp.in > Ru2Pt2-pp.out &&
dos.x     -i Ru2Pt2-dos.in > Ru2Pt2-dos.out &&
average.x -i Ru2Pt2-wf.ave.in > Ru2Pt2-wf.ave.out &&
mv avg.dat Ru2Pt2-avg.dat &&
projwfc.x -i Ru2Pt2-pdos.in > Ru2Pt2-pdos.out &&
sleep 10

pp.x      -i Ru2Re2-pp.in > Ru2Re2-pp.out &&
dos.x     -i Ru2Re2-dos.in > Ru2Re2-dos.out &&
average.x -i Ru2Re2-wf.ave.in > Ru2Re2-wf.ave.out &&
mv avg.dat Ru2Re2-avg.dat &&
projwfc.x -i Ru2Re2-pdos.in > Ru2Re2-pdos.out &&
sleep 10

pp.x      -i Sc2Pt2-pp.in > Sc2Pt2-pp.out &&
dos.x     -i Sc2Pt2-dos.in > Sc2Pt2-dos.out &&
average.x -i Sc2Pt2-wf.ave.in > Sc2Pt2-wf.ave.out &&
mv avg.dat Sc2Pt2-avg.dat &&
projwfc.x -i Sc2Pt2-pdos.in > Sc2Pt2-pdos.out &&
sleep 10

pp.x      -i Sc2Re2-pp.in > Sc2Re2-pp.out &&
dos.x     -i Sc2Re2-dos.in > Sc2Re2-dos.out &&
average.x -i Sc2Re2-wf.ave.in > Sc2Re2-wf.ave.out &&
mv avg.dat Sc2Re2-avg.dat &&
projwfc.x -i Sc2Re2-pdos.in > Sc2Re2-pdos.out &&
sleep 10

pp.x      -i Sc2Ti2-pp.in > Sc2Ti2-pp.out &&
dos.x     -i Sc2Ti2-dos.in > Sc2Ti2-dos.out &&
average.x -i Sc2Ti2-wf.ave.in > Sc2Ti2-wf.ave.out &&
mv avg.dat Sc2Ti2-avg.dat &&
projwfc.x -i Sc2Ti2-pdos.in > Sc2Ti2-pdos.out &&
sleep 10

pp.x      -i Ti2Ag2-pp.in > Ti2Ag2-pp.out &&
dos.x     -i Ti2Ag2-dos.in > Ti2Ag2-dos.out &&
average.x -i Ti2Ag2-wf.ave.in > Ti2Ag2-wf.ave.out &&
mv avg.dat Ti2Ag2-avg.dat &&
projwfc.x -i Ti2Ag2-pdos.in > Ti2Ag2-pdos.out &&
sleep 10

pp.x      -i Ti2Au2-pp.in > Ti2Au2-pp.out &&
dos.x     -i Ti2Au2-dos.in > Ti2Au2-dos.out &&
average.x -i Ti2Au2-wf.ave.in > Ti2Au2-wf.ave.out &&
mv avg.dat Ti2Au2-avg.dat &&
projwfc.x -i Ti2Au2-pdos.in > Ti2Au2-pdos.out &&
sleep 10

pp.x      -i Ti2Cd2-pp.in > Ti2Cd2-pp.out &&
dos.x     -i Ti2Cd2-dos.in > Ti2Cd2-dos.out &&
average.x -i Ti2Cd2-wf.ave.in > Ti2Cd2-wf.ave.out &&
mv avg.dat Ti2Cd2-avg.dat &&
projwfc.x -i Ti2Cd2-pdos.in > Ti2Cd2-pdos.out &&
sleep 10

pp.x      -i Ti2Cr2-pp.in > Ti2Cr2-pp.out &&
dos.x     -i Ti2Cr2-dos.in > Ti2Cr2-dos.out &&
average.x -i Ti2Cr2-wf.ave.in > Ti2Cr2-wf.ave.out &&
mv avg.dat Ti2Cr2-avg.dat &&
projwfc.x -i Ti2Cr2-pdos.in > Ti2Cr2-pdos.out &&
sleep 10

pp.x      -i Ti2Cu2-pp.in > Ti2Cu2-pp.out &&
dos.x     -i Ti2Cu2-dos.in > Ti2Cu2-dos.out &&
average.x -i Ti2Cu2-wf.ave.in > Ti2Cu2-wf.ave.out &&
mv avg.dat Ti2Cu2-avg.dat &&
projwfc.x -i Ti2Cu2-pdos.in > Ti2Cu2-pdos.out &&
sleep 10

pp.x      -i Ti2Hg2-pp.in > Ti2Hg2-pp.out &&
dos.x     -i Ti2Hg2-dos.in > Ti2Hg2-dos.out &&
average.x -i Ti2Hg2-wf.ave.in > Ti2Hg2-wf.ave.out &&
mv avg.dat Ti2Hg2-avg.dat &&
projwfc.x -i Ti2Hg2-pdos.in > Ti2Hg2-pdos.out &&
sleep 10

pp.x      -i Ti2Mo2-pp.in > Ti2Mo2-pp.out &&
dos.x     -i Ti2Mo2-dos.in > Ti2Mo2-dos.out &&
average.x -i Ti2Mo2-wf.ave.in > Ti2Mo2-wf.ave.out &&
mv avg.dat Ti2Mo2-avg.dat &&
projwfc.x -i Ti2Mo2-pdos.in > Ti2Mo2-pdos.out &&
sleep 10

pp.x      -i Ti2Nb2-pp.in > Ti2Nb2-pp.out &&
dos.x     -i Ti2Nb2-dos.in > Ti2Nb2-dos.out &&
average.x -i Ti2Nb2-wf.ave.in > Ti2Nb2-wf.ave.out &&
mv avg.dat Ti2Nb2-avg.dat &&
projwfc.x -i Ti2Nb2-pdos.in > Ti2Nb2-pdos.out &&
sleep 10

pp.x      -i Ti2Os2-pp.in > Ti2Os2-pp.out &&
dos.x     -i Ti2Os2-dos.in > Ti2Os2-dos.out &&
average.x -i Ti2Os2-wf.ave.in > Ti2Os2-wf.ave.out &&
mv avg.dat Ti2Os2-avg.dat &&
projwfc.x -i Ti2Os2-pdos.in > Ti2Os2-pdos.out &&
sleep 10

pp.x      -i Ti2Pt2-pp.in > Ti2Pt2-pp.out &&
dos.x     -i Ti2Pt2-dos.in > Ti2Pt2-dos.out &&
average.x -i Ti2Pt2-wf.ave.in > Ti2Pt2-wf.ave.out &&
mv avg.dat Ti2Pt2-avg.dat &&
projwfc.x -i Ti2Pt2-pdos.in > Ti2Pt2-pdos.out &&
sleep 10

pp.x      -i Ti2Re2-pp.in > Ti2Re2-pp.out &&
dos.x     -i Ti2Re2-dos.in > Ti2Re2-dos.out &&
average.x -i Ti2Re2-wf.ave.in > Ti2Re2-wf.ave.out &&
mv avg.dat Ti2Re2-avg.dat &&
projwfc.x -i Ti2Re2-pdos.in > Ti2Re2-pdos.out &&
sleep 10

pp.x      -i Ti2Rh2-pp.in > Ti2Rh2-pp.out &&
dos.x     -i Ti2Rh2-dos.in > Ti2Rh2-dos.out &&
average.x -i Ti2Rh2-wf.ave.in > Ti2Rh2-wf.ave.out &&
mv avg.dat Ti2Rh2-avg.dat &&
projwfc.x -i Ti2Rh2-pdos.in > Ti2Rh2-pdos.out &&
sleep 10

pp.x      -i Ti2Ru2-pp.in > Ti2Ru2-pp.out &&
dos.x     -i Ti2Ru2-dos.in > Ti2Ru2-dos.out &&
average.x -i Ti2Ru2-wf.ave.in > Ti2Ru2-wf.ave.out &&
mv avg.dat Ti2Ru2-avg.dat &&
projwfc.x -i Ti2Ru2-pdos.in > Ti2Ru2-pdos.out &&
sleep 10

pp.x      -i Ti2Y2-pp.in > Ti2Y2-pp.out &&
dos.x     -i Ti2Y2-dos.in > Ti2Y2-dos.out &&
average.x -i Ti2Y2-wf.ave.in > Ti2Y2-wf.ave.out &&
mv avg.dat Ti2Y2-avg.dat &&
projwfc.x -i Ti2Y2-pdos.in > Ti2Y2-pdos.out &&
sleep 10

pp.x      -i Ti2Zr2-pp.in > Ti2Zr2-pp.out &&
dos.x     -i Ti2Zr2-dos.in > Ti2Zr2-dos.out &&
average.x -i Ti2Zr2-wf.ave.in > Ti2Zr2-wf.ave.out &&
mv avg.dat Ti2Zr2-avg.dat &&
projwfc.x -i Ti2Zr2-pdos.in > Ti2Zr2-pdos.out &&
sleep 10

pp.x      -i Y2Pt2-pp.in > Y2Pt2-pp.out &&
dos.x     -i Y2Pt2-dos.in > Y2Pt2-dos.out &&
average.x -i Y2Pt2-wf.ave.in > Y2Pt2-wf.ave.out &&
mv avg.dat Y2Pt2-avg.dat &&
projwfc.x -i Y2Pt2-pdos.in > Y2Pt2-pdos.out &&
sleep 10

pp.x      -i Y2Re2-pp.in > Y2Re2-pp.out &&
dos.x     -i Y2Re2-dos.in > Y2Re2-dos.out &&
average.x -i Y2Re2-wf.ave.in > Y2Re2-wf.ave.out &&
mv avg.dat Y2Re2-avg.dat &&
projwfc.x -i Y2Re2-pdos.in > Y2Re2-pdos.out &&
sleep 10

pp.x      -i Zr2Pt2-pp.in > Zr2Pt2-pp.out &&
dos.x     -i Zr2Pt2-dos.in > Zr2Pt2-dos.out &&
average.x -i Zr2Pt2-wf.ave.in > Zr2Pt2-wf.ave.out &&
mv avg.dat Zr2Pt2-avg.dat &&
projwfc.x -i Zr2Pt2-pdos.in > Zr2Pt2-pdos.out &&
sleep 10

pp.x      -i Zr2Re2-pp.in > Zr2Re2-pp.out &&
dos.x     -i Zr2Re2-dos.in > Zr2Re2-dos.out &&
average.x -i Zr2Re2-wf.ave.in > Zr2Re2-wf.ave.out &&
mv avg.dat Zr2Re2-avg.dat &&
projwfc.x -i Zr2Re2-pdos.in > Zr2Re2-pdos.out &&
sleep 10

