#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-01##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.01.out     ##CHANGE
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
pp.x      -i Ag2W2-pp.in > Ag2W2-pp.out &&
dos.x     -i Ag2W2-dos.in > Ag2W2-dos.out &&
average.x -i Ag2W2-wf.ave.in > Ag2W2-wf.ave.out &&
mv avg.dat Ag2W2-avg.dat &&
projwfc.x -i Ag2W2-pdos.in > Ag2W2-pdos.out &&
sleep 10

pp.x      -i Cd2W2-pp.in > Cd2W2-pp.out &&
dos.x     -i Cd2W2-dos.in > Cd2W2-dos.out &&
average.x -i Cd2W2-wf.ave.in > Cd2W2-wf.ave.out &&
mv avg.dat Cd2W2-avg.dat &&
projwfc.x -i Cd2W2-pdos.in > Cd2W2-pdos.out &&
sleep 10

pp.x      -i Cr2Pd2-pp.in > Cr2Pd2-pp.out &&
dos.x     -i Cr2Pd2-dos.in > Cr2Pd2-dos.out &&
average.x -i Cr2Pd2-wf.ave.in > Cr2Pd2-wf.ave.out &&
mv avg.dat Cr2Pd2-avg.dat &&
projwfc.x -i Cr2Pd2-pdos.in > Cr2Pd2-pdos.out &&
sleep 10

pp.x      -i Cr2W2-pp.in > Cr2W2-pp.out &&
dos.x     -i Cr2W2-dos.in > Cr2W2-dos.out &&
average.x -i Cr2W2-wf.ave.in > Cr2W2-wf.ave.out &&
mv avg.dat Cr2W2-avg.dat &&
projwfc.x -i Cr2W2-pdos.in > Cr2W2-pdos.out &&
sleep 10

pp.x      -i Cu2Pd2-pp.in > Cu2Pd2-pp.out &&
dos.x     -i Cu2Pd2-dos.in > Cu2Pd2-dos.out &&
average.x -i Cu2Pd2-wf.ave.in > Cu2Pd2-wf.ave.out &&
mv avg.dat Cu2Pd2-avg.dat &&
projwfc.x -i Cu2Pd2-pdos.in > Cu2Pd2-pdos.out &&
sleep 10

pp.x      -i Cu2W2-pp.in > Cu2W2-pp.out &&
dos.x     -i Cu2W2-dos.in > Cu2W2-dos.out &&
average.x -i Cu2W2-wf.ave.in > Cu2W2-wf.ave.out &&
mv avg.dat Cu2W2-avg.dat &&
projwfc.x -i Cu2W2-pdos.in > Cu2W2-pdos.out &&
sleep 10

pp.x      -i Mo2Pd2-pp.in > Mo2Pd2-pp.out &&
dos.x     -i Mo2Pd2-dos.in > Mo2Pd2-dos.out &&
average.x -i Mo2Pd2-wf.ave.in > Mo2Pd2-wf.ave.out &&
mv avg.dat Mo2Pd2-avg.dat &&
projwfc.x -i Mo2Pd2-pdos.in > Mo2Pd2-pdos.out &&
sleep 10

pp.x      -i Mo2W2-pp.in > Mo2W2-pp.out &&
dos.x     -i Mo2W2-dos.in > Mo2W2-dos.out &&
average.x -i Mo2W2-wf.ave.in > Mo2W2-wf.ave.out &&
mv avg.dat Mo2W2-avg.dat &&
projwfc.x -i Mo2W2-pdos.in > Mo2W2-pdos.out &&
sleep 10

pp.x      -i Nb2Pd2-pp.in > Nb2Pd2-pp.out &&
dos.x     -i Nb2Pd2-dos.in > Nb2Pd2-dos.out &&
average.x -i Nb2Pd2-wf.ave.in > Nb2Pd2-wf.ave.out &&
mv avg.dat Nb2Pd2-avg.dat &&
projwfc.x -i Nb2Pd2-pdos.in > Nb2Pd2-pdos.out &&
sleep 10

pp.x      -i Nb2W2-pp.in > Nb2W2-pp.out &&
dos.x     -i Nb2W2-dos.in > Nb2W2-dos.out &&
average.x -i Nb2W2-wf.ave.in > Nb2W2-wf.ave.out &&
mv avg.dat Nb2W2-avg.dat &&
projwfc.x -i Nb2W2-pdos.in > Nb2W2-pdos.out &&
sleep 10

pp.x      -i Pd2Ag2-pp.in > Pd2Ag2-pp.out &&
dos.x     -i Pd2Ag2-dos.in > Pd2Ag2-dos.out &&
average.x -i Pd2Ag2-wf.ave.in > Pd2Ag2-wf.ave.out &&
mv avg.dat Pd2Ag2-avg.dat &&
projwfc.x -i Pd2Ag2-pdos.in > Pd2Ag2-pdos.out &&
sleep 10

pp.x      -i Pd2Au2-pp.in > Pd2Au2-pp.out &&
dos.x     -i Pd2Au2-dos.in > Pd2Au2-dos.out &&
average.x -i Pd2Au2-wf.ave.in > Pd2Au2-wf.ave.out &&
mv avg.dat Pd2Au2-avg.dat &&
projwfc.x -i Pd2Au2-pdos.in > Pd2Au2-pdos.out &&
sleep 10

pp.x      -i Pd2Cd2-pp.in > Pd2Cd2-pp.out &&
dos.x     -i Pd2Cd2-dos.in > Pd2Cd2-dos.out &&
average.x -i Pd2Cd2-wf.ave.in > Pd2Cd2-wf.ave.out &&
mv avg.dat Pd2Cd2-avg.dat &&
projwfc.x -i Pd2Cd2-pdos.in > Pd2Cd2-pdos.out &&
sleep 10

pp.x      -i Pd2Hg2-pp.in > Pd2Hg2-pp.out &&
dos.x     -i Pd2Hg2-dos.in > Pd2Hg2-dos.out &&
average.x -i Pd2Hg2-wf.ave.in > Pd2Hg2-wf.ave.out &&
mv avg.dat Pd2Hg2-avg.dat &&
projwfc.x -i Pd2Hg2-pdos.in > Pd2Hg2-pdos.out &&
sleep 10

pp.x      -i Pd2Ir2-pp.in > Pd2Ir2-pp.out &&
dos.x     -i Pd2Ir2-dos.in > Pd2Ir2-dos.out &&
average.x -i Pd2Ir2-wf.ave.in > Pd2Ir2-wf.ave.out &&
mv avg.dat Pd2Ir2-avg.dat &&
projwfc.x -i Pd2Ir2-pdos.in > Pd2Ir2-pdos.out &&
sleep 10

pp.x      -i Pd2Os2-pp.in > Pd2Os2-pp.out &&
dos.x     -i Pd2Os2-dos.in > Pd2Os2-dos.out &&
average.x -i Pd2Os2-wf.ave.in > Pd2Os2-wf.ave.out &&
mv avg.dat Pd2Os2-avg.dat &&
projwfc.x -i Pd2Os2-pdos.in > Pd2Os2-pdos.out &&
sleep 10

pp.x      -i Pd2Pt2-pp.in > Pd2Pt2-pp.out &&
dos.x     -i Pd2Pt2-dos.in > Pd2Pt2-dos.out &&
average.x -i Pd2Pt2-wf.ave.in > Pd2Pt2-wf.ave.out &&
mv avg.dat Pd2Pt2-avg.dat &&
projwfc.x -i Pd2Pt2-pdos.in > Pd2Pt2-pdos.out &&
sleep 10

pp.x      -i Pd2Re2-pp.in > Pd2Re2-pp.out &&
dos.x     -i Pd2Re2-dos.in > Pd2Re2-dos.out &&
average.x -i Pd2Re2-wf.ave.in > Pd2Re2-wf.ave.out &&
mv avg.dat Pd2Re2-avg.dat &&
projwfc.x -i Pd2Re2-pdos.in > Pd2Re2-pdos.out &&
sleep 10

pp.x      -i Pd2W2-pp.in > Pd2W2-pp.out &&
dos.x     -i Pd2W2-dos.in > Pd2W2-dos.out &&
average.x -i Pd2W2-wf.ave.in > Pd2W2-wf.ave.out &&
mv avg.dat Pd2W2-avg.dat &&
projwfc.x -i Pd2W2-pdos.in > Pd2W2-pdos.out &&
sleep 10

pp.x      -i Pd2Y2-pp.in > Pd2Y2-pp.out &&
dos.x     -i Pd2Y2-dos.in > Pd2Y2-dos.out &&
average.x -i Pd2Y2-wf.ave.in > Pd2Y2-wf.ave.out &&
mv avg.dat Pd2Y2-avg.dat &&
projwfc.x -i Pd2Y2-pdos.in > Pd2Y2-pdos.out &&
sleep 10

pp.x      -i Rh2Pd2-pp.in > Rh2Pd2-pp.out &&
dos.x     -i Rh2Pd2-dos.in > Rh2Pd2-dos.out &&
average.x -i Rh2Pd2-wf.ave.in > Rh2Pd2-wf.ave.out &&
mv avg.dat Rh2Pd2-avg.dat &&
projwfc.x -i Rh2Pd2-pdos.in > Rh2Pd2-pdos.out &&
sleep 10

pp.x      -i Rh2W2-pp.in > Rh2W2-pp.out &&
dos.x     -i Rh2W2-dos.in > Rh2W2-dos.out &&
average.x -i Rh2W2-wf.ave.in > Rh2W2-wf.ave.out &&
mv avg.dat Rh2W2-avg.dat &&
projwfc.x -i Rh2W2-pdos.in > Rh2W2-pdos.out &&
sleep 10

pp.x      -i Ru2Pd2-pp.in > Ru2Pd2-pp.out &&
dos.x     -i Ru2Pd2-dos.in > Ru2Pd2-dos.out &&
average.x -i Ru2Pd2-wf.ave.in > Ru2Pd2-wf.ave.out &&
mv avg.dat Ru2Pd2-avg.dat &&
projwfc.x -i Ru2Pd2-pdos.in > Ru2Pd2-pdos.out &&
sleep 10

pp.x      -i Ru2W2-pp.in > Ru2W2-pp.out &&
dos.x     -i Ru2W2-dos.in > Ru2W2-dos.out &&
average.x -i Ru2W2-wf.ave.in > Ru2W2-wf.ave.out &&
mv avg.dat Ru2W2-avg.dat &&
projwfc.x -i Ru2W2-pdos.in > Ru2W2-pdos.out &&
sleep 10

pp.x      -i Sc2Pd2-pp.in > Sc2Pd2-pp.out &&
dos.x     -i Sc2Pd2-dos.in > Sc2Pd2-dos.out &&
average.x -i Sc2Pd2-wf.ave.in > Sc2Pd2-wf.ave.out &&
mv avg.dat Sc2Pd2-avg.dat &&
projwfc.x -i Sc2Pd2-pdos.in > Sc2Pd2-pdos.out &&
sleep 10

pp.x      -i Sc2V2-pp.in > Sc2V2-pp.out &&
dos.x     -i Sc2V2-dos.in > Sc2V2-dos.out &&
average.x -i Sc2V2-wf.ave.in > Sc2V2-wf.ave.out &&
mv avg.dat Sc2V2-avg.dat &&
projwfc.x -i Sc2V2-pdos.in > Sc2V2-pdos.out &&
sleep 10

pp.x      -i Sc2W2-pp.in > Sc2W2-pp.out &&
dos.x     -i Sc2W2-dos.in > Sc2W2-dos.out &&
average.x -i Sc2W2-wf.ave.in > Sc2W2-wf.ave.out &&
mv avg.dat Sc2W2-avg.dat &&
projwfc.x -i Sc2W2-pdos.in > Sc2W2-pdos.out &&
sleep 10

pp.x      -i Tc2Pd2-pp.in > Tc2Pd2-pp.out &&
dos.x     -i Tc2Pd2-dos.in > Tc2Pd2-dos.out &&
average.x -i Tc2Pd2-wf.ave.in > Tc2Pd2-wf.ave.out &&
mv avg.dat Tc2Pd2-avg.dat &&
projwfc.x -i Tc2Pd2-pdos.in > Tc2Pd2-pdos.out &&
sleep 10

pp.x      -i Tc2W2-pp.in > Tc2W2-pp.out &&
dos.x     -i Tc2W2-dos.in > Tc2W2-dos.out &&
average.x -i Tc2W2-wf.ave.in > Tc2W2-wf.ave.out &&
mv avg.dat Tc2W2-avg.dat &&
projwfc.x -i Tc2W2-pdos.in > Tc2W2-pdos.out &&
sleep 10

pp.x      -i Ti2Pd2-pp.in > Ti2Pd2-pp.out &&
dos.x     -i Ti2Pd2-dos.in > Ti2Pd2-dos.out &&
average.x -i Ti2Pd2-wf.ave.in > Ti2Pd2-wf.ave.out &&
mv avg.dat Ti2Pd2-avg.dat &&
projwfc.x -i Ti2Pd2-pdos.in > Ti2Pd2-pdos.out &&
sleep 10

pp.x      -i Ti2V2-pp.in > Ti2V2-pp.out &&
dos.x     -i Ti2V2-dos.in > Ti2V2-dos.out &&
average.x -i Ti2V2-wf.ave.in > Ti2V2-wf.ave.out &&
mv avg.dat Ti2V2-avg.dat &&
projwfc.x -i Ti2V2-pdos.in > Ti2V2-pdos.out &&
sleep 10

pp.x      -i Ti2W2-pp.in > Ti2W2-pp.out &&
dos.x     -i Ti2W2-dos.in > Ti2W2-dos.out &&
average.x -i Ti2W2-wf.ave.in > Ti2W2-wf.ave.out &&
mv avg.dat Ti2W2-avg.dat &&
projwfc.x -i Ti2W2-pdos.in > Ti2W2-pdos.out &&
sleep 10

pp.x      -i V2Ag2-pp.in > V2Ag2-pp.out &&
dos.x     -i V2Ag2-dos.in > V2Ag2-dos.out &&
average.x -i V2Ag2-wf.ave.in > V2Ag2-wf.ave.out &&
mv avg.dat V2Ag2-avg.dat &&
projwfc.x -i V2Ag2-pdos.in > V2Ag2-pdos.out &&
sleep 10

pp.x      -i V2Au2-pp.in > V2Au2-pp.out &&
dos.x     -i V2Au2-dos.in > V2Au2-dos.out &&
average.x -i V2Au2-wf.ave.in > V2Au2-wf.ave.out &&
mv avg.dat V2Au2-avg.dat &&
projwfc.x -i V2Au2-pdos.in > V2Au2-pdos.out &&
sleep 10

pp.x      -i V2Cd2-pp.in > V2Cd2-pp.out &&
dos.x     -i V2Cd2-dos.in > V2Cd2-dos.out &&
average.x -i V2Cd2-wf.ave.in > V2Cd2-wf.ave.out &&
mv avg.dat V2Cd2-avg.dat &&
projwfc.x -i V2Cd2-pdos.in > V2Cd2-pdos.out &&
sleep 10

pp.x      -i V2Cr2-pp.in > V2Cr2-pp.out &&
dos.x     -i V2Cr2-dos.in > V2Cr2-dos.out &&
average.x -i V2Cr2-wf.ave.in > V2Cr2-wf.ave.out &&
mv avg.dat V2Cr2-avg.dat &&
projwfc.x -i V2Cr2-pdos.in > V2Cr2-pdos.out &&
sleep 10

pp.x      -i V2Cu2-pp.in > V2Cu2-pp.out &&
dos.x     -i V2Cu2-dos.in > V2Cu2-dos.out &&
average.x -i V2Cu2-wf.ave.in > V2Cu2-wf.ave.out &&
mv avg.dat V2Cu2-avg.dat &&
projwfc.x -i V2Cu2-pdos.in > V2Cu2-pdos.out &&
sleep 10

pp.x      -i V2Hg2-pp.in > V2Hg2-pp.out &&
dos.x     -i V2Hg2-dos.in > V2Hg2-dos.out &&
average.x -i V2Hg2-wf.ave.in > V2Hg2-wf.ave.out &&
mv avg.dat V2Hg2-avg.dat &&
projwfc.x -i V2Hg2-pdos.in > V2Hg2-pdos.out &&
sleep 10

pp.x      -i V2Ir2-pp.in > V2Ir2-pp.out &&
dos.x     -i V2Ir2-dos.in > V2Ir2-dos.out &&
average.x -i V2Ir2-wf.ave.in > V2Ir2-wf.ave.out &&
mv avg.dat V2Ir2-avg.dat &&
projwfc.x -i V2Ir2-pdos.in > V2Ir2-pdos.out &&
sleep 10

pp.x      -i V2Mo2-pp.in > V2Mo2-pp.out &&
dos.x     -i V2Mo2-dos.in > V2Mo2-dos.out &&
average.x -i V2Mo2-wf.ave.in > V2Mo2-wf.ave.out &&
mv avg.dat V2Mo2-avg.dat &&
projwfc.x -i V2Mo2-pdos.in > V2Mo2-pdos.out &&
sleep 10

pp.x      -i V2Nb2-pp.in > V2Nb2-pp.out &&
dos.x     -i V2Nb2-dos.in > V2Nb2-dos.out &&
average.x -i V2Nb2-wf.ave.in > V2Nb2-wf.ave.out &&
mv avg.dat V2Nb2-avg.dat &&
projwfc.x -i V2Nb2-pdos.in > V2Nb2-pdos.out &&
sleep 10

pp.x      -i V2Os2-pp.in > V2Os2-pp.out &&
dos.x     -i V2Os2-dos.in > V2Os2-dos.out &&
average.x -i V2Os2-wf.ave.in > V2Os2-wf.ave.out &&
mv avg.dat V2Os2-avg.dat &&
projwfc.x -i V2Os2-pdos.in > V2Os2-pdos.out &&
sleep 10

pp.x      -i V2Pd2-pp.in > V2Pd2-pp.out &&
dos.x     -i V2Pd2-dos.in > V2Pd2-dos.out &&
average.x -i V2Pd2-wf.ave.in > V2Pd2-wf.ave.out &&
mv avg.dat V2Pd2-avg.dat &&
projwfc.x -i V2Pd2-pdos.in > V2Pd2-pdos.out &&
sleep 10

pp.x      -i V2Pt2-pp.in > V2Pt2-pp.out &&
dos.x     -i V2Pt2-dos.in > V2Pt2-dos.out &&
average.x -i V2Pt2-wf.ave.in > V2Pt2-wf.ave.out &&
mv avg.dat V2Pt2-avg.dat &&
projwfc.x -i V2Pt2-pdos.in > V2Pt2-pdos.out &&
sleep 10

pp.x      -i V2Re2-pp.in > V2Re2-pp.out &&
dos.x     -i V2Re2-dos.in > V2Re2-dos.out &&
average.x -i V2Re2-wf.ave.in > V2Re2-wf.ave.out &&
mv avg.dat V2Re2-avg.dat &&
projwfc.x -i V2Re2-pdos.in > V2Re2-pdos.out &&
sleep 10

pp.x      -i V2Rh2-pp.in > V2Rh2-pp.out &&
dos.x     -i V2Rh2-dos.in > V2Rh2-dos.out &&
average.x -i V2Rh2-wf.ave.in > V2Rh2-wf.ave.out &&
mv avg.dat V2Rh2-avg.dat &&
projwfc.x -i V2Rh2-pdos.in > V2Rh2-pdos.out &&
sleep 10

pp.x      -i V2Ru2-pp.in > V2Ru2-pp.out &&
dos.x     -i V2Ru2-dos.in > V2Ru2-dos.out &&
average.x -i V2Ru2-wf.ave.in > V2Ru2-wf.ave.out &&
mv avg.dat V2Ru2-avg.dat &&
projwfc.x -i V2Ru2-pdos.in > V2Ru2-pdos.out &&
sleep 10

pp.x      -i V2Tc2-pp.in > V2Tc2-pp.out &&
dos.x     -i V2Tc2-dos.in > V2Tc2-dos.out &&
average.x -i V2Tc2-wf.ave.in > V2Tc2-wf.ave.out &&
mv avg.dat V2Tc2-avg.dat &&
projwfc.x -i V2Tc2-pdos.in > V2Tc2-pdos.out &&
sleep 10

pp.x      -i V2W2-pp.in > V2W2-pp.out &&
dos.x     -i V2W2-dos.in > V2W2-dos.out &&
average.x -i V2W2-wf.ave.in > V2W2-wf.ave.out &&
mv avg.dat V2W2-avg.dat &&
projwfc.x -i V2W2-pdos.in > V2W2-pdos.out &&
sleep 10

pp.x      -i V2Y2-pp.in > V2Y2-pp.out &&
dos.x     -i V2Y2-dos.in > V2Y2-dos.out &&
average.x -i V2Y2-wf.ave.in > V2Y2-wf.ave.out &&
mv avg.dat V2Y2-avg.dat &&
projwfc.x -i V2Y2-pdos.in > V2Y2-pdos.out &&
sleep 10

pp.x      -i V2Zr2-pp.in > V2Zr2-pp.out &&
dos.x     -i V2Zr2-dos.in > V2Zr2-dos.out &&
average.x -i V2Zr2-wf.ave.in > V2Zr2-wf.ave.out &&
mv avg.dat V2Zr2-avg.dat &&
projwfc.x -i V2Zr2-pdos.in > V2Zr2-pdos.out &&
sleep 10

pp.x      -i W2Au2-pp.in > W2Au2-pp.out &&
dos.x     -i W2Au2-dos.in > W2Au2-dos.out &&
average.x -i W2Au2-wf.ave.in > W2Au2-wf.ave.out &&
mv avg.dat W2Au2-avg.dat &&
projwfc.x -i W2Au2-pdos.in > W2Au2-pdos.out &&
sleep 10

pp.x      -i W2Hg2-pp.in > W2Hg2-pp.out &&
dos.x     -i W2Hg2-dos.in > W2Hg2-dos.out &&
average.x -i W2Hg2-wf.ave.in > W2Hg2-wf.ave.out &&
mv avg.dat W2Hg2-avg.dat &&
projwfc.x -i W2Hg2-pdos.in > W2Hg2-pdos.out &&
sleep 10

pp.x      -i W2Ir2-pp.in > W2Ir2-pp.out &&
dos.x     -i W2Ir2-dos.in > W2Ir2-dos.out &&
average.x -i W2Ir2-wf.ave.in > W2Ir2-wf.ave.out &&
mv avg.dat W2Ir2-avg.dat &&
projwfc.x -i W2Ir2-pdos.in > W2Ir2-pdos.out &&
sleep 10

pp.x      -i W2Os2-pp.in > W2Os2-pp.out &&
dos.x     -i W2Os2-dos.in > W2Os2-dos.out &&
average.x -i W2Os2-wf.ave.in > W2Os2-wf.ave.out &&
mv avg.dat W2Os2-avg.dat &&
projwfc.x -i W2Os2-pdos.in > W2Os2-pdos.out &&
sleep 10

pp.x      -i W2Pt2-pp.in > W2Pt2-pp.out &&
dos.x     -i W2Pt2-dos.in > W2Pt2-dos.out &&
average.x -i W2Pt2-wf.ave.in > W2Pt2-wf.ave.out &&
mv avg.dat W2Pt2-avg.dat &&
projwfc.x -i W2Pt2-pdos.in > W2Pt2-pdos.out &&
sleep 10

pp.x      -i W2Re2-pp.in > W2Re2-pp.out &&
dos.x     -i W2Re2-dos.in > W2Re2-dos.out &&
average.x -i W2Re2-wf.ave.in > W2Re2-wf.ave.out &&
mv avg.dat W2Re2-avg.dat &&
projwfc.x -i W2Re2-pdos.in > W2Re2-pdos.out &&
sleep 10

pp.x      -i Y2W2-pp.in > Y2W2-pp.out &&
dos.x     -i Y2W2-dos.in > Y2W2-dos.out &&
average.x -i Y2W2-wf.ave.in > Y2W2-wf.ave.out &&
mv avg.dat Y2W2-avg.dat &&
projwfc.x -i Y2W2-pdos.in > Y2W2-pdos.out &&
sleep 10

pp.x      -i Zr2Pd2-pp.in > Zr2Pd2-pp.out &&
dos.x     -i Zr2Pd2-dos.in > Zr2Pd2-dos.out &&
average.x -i Zr2Pd2-wf.ave.in > Zr2Pd2-wf.ave.out &&
mv avg.dat Zr2Pd2-avg.dat &&
projwfc.x -i Zr2Pd2-pdos.in > Zr2Pd2-pdos.out &&
sleep 10

pp.x      -i Zr2W2-pp.in > Zr2W2-pp.out &&
dos.x     -i Zr2W2-dos.in > Zr2W2-dos.out &&
average.x -i Zr2W2-wf.ave.in > Zr2W2-wf.ave.out &&
mv avg.dat Zr2W2-avg.dat &&
projwfc.x -i Zr2W2-pdos.in > Zr2W2-pdos.out &&
sleep 10

