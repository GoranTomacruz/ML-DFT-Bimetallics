#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-19##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.19.out     ##CHANGE
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
pp.x      -i Cr2Zn2-pp.in > Cr2Zn2-pp.out &&
dos.x     -i Cr2Zn2-dos.in > Cr2Zn2-dos.out &&
average.x -i Cr2Zn2-wf.ave.in > Cr2Zn2-wf.ave.out &&
mv avg.dat Cr2Zn2-avg.dat &&
projwfc.x -i Cr2Zn2-pdos.in > Cr2Zn2-pdos.out &&
sleep 10

pp.x      -i Cu2Zn2-pp.in > Cu2Zn2-pp.out &&
dos.x     -i Cu2Zn2-dos.in > Cu2Zn2-dos.out &&
average.x -i Cu2Zn2-wf.ave.in > Cu2Zn2-wf.ave.out &&
mv avg.dat Cu2Zn2-avg.dat &&
projwfc.x -i Cu2Zn2-pdos.in > Cu2Zn2-pdos.out &&
sleep 10

pp.x      -i Sc2Zn2-pp.in > Sc2Zn2-pp.out &&
dos.x     -i Sc2Zn2-dos.in > Sc2Zn2-dos.out &&
average.x -i Sc2Zn2-wf.ave.in > Sc2Zn2-wf.ave.out &&
mv avg.dat Sc2Zn2-avg.dat &&
projwfc.x -i Sc2Zn2-pdos.in > Sc2Zn2-pdos.out &&
sleep 10

pp.x      -i Ti2Zn2-pp.in > Ti2Zn2-pp.out &&
dos.x     -i Ti2Zn2-dos.in > Ti2Zn2-dos.out &&
average.x -i Ti2Zn2-wf.ave.in > Ti2Zn2-wf.ave.out &&
mv avg.dat Ti2Zn2-avg.dat &&
projwfc.x -i Ti2Zn2-pdos.in > Ti2Zn2-pdos.out &&
sleep 10

pp.x      -i V2Zn2-pp.in > V2Zn2-pp.out &&
dos.x     -i V2Zn2-dos.in > V2Zn2-dos.out &&
average.x -i V2Zn2-wf.ave.in > V2Zn2-wf.ave.out &&
mv avg.dat V2Zn2-avg.dat &&
projwfc.x -i V2Zn2-pdos.in > V2Zn2-pdos.out &&
sleep 10

pp.x      -i Zn2Ag2-pp.in > Zn2Ag2-pp.out &&
dos.x     -i Zn2Ag2-dos.in > Zn2Ag2-dos.out &&
average.x -i Zn2Ag2-wf.ave.in > Zn2Ag2-wf.ave.out &&
mv avg.dat Zn2Ag2-avg.dat &&
projwfc.x -i Zn2Ag2-pdos.in > Zn2Ag2-pdos.out &&
sleep 10

pp.x      -i Fe2Zn2-pp.in > Fe2Zn2-pp.out &&
dos.x     -i Fe2Zn2-dos.in > Fe2Zn2-dos.out &&
average.x -i Fe2Zn2-wf.ave.in > Fe2Zn2-wf.ave.out &&
mv avg.dat Fe2Zn2-avg.dat &&
projwfc.x -i Fe2Zn2-pdos.in > Fe2Zn2-pdos.out &&
sleep 10

pp.x      -i Zn2Cd2-pp.in > Zn2Cd2-pp.out &&
dos.x     -i Zn2Cd2-dos.in > Zn2Cd2-dos.out &&
average.x -i Zn2Cd2-wf.ave.in > Zn2Cd2-wf.ave.out &&
mv avg.dat Zn2Cd2-avg.dat &&
projwfc.x -i Zn2Cd2-pdos.in > Zn2Cd2-pdos.out &&
sleep 10

pp.x      -i Zn2Hf2-pp.in > Zn2Hf2-pp.out &&
dos.x     -i Zn2Hf2-dos.in > Zn2Hf2-dos.out &&
average.x -i Zn2Hf2-wf.ave.in > Zn2Hf2-wf.ave.out &&
mv avg.dat Zn2Hf2-avg.dat &&
projwfc.x -i Zn2Hf2-pdos.in > Zn2Hf2-pdos.out &&
sleep 10

pp.x      -i Zn2Hg2-pp.in > Zn2Hg2-pp.out &&
dos.x     -i Zn2Hg2-dos.in > Zn2Hg2-dos.out &&
average.x -i Zn2Hg2-wf.ave.in > Zn2Hg2-wf.ave.out &&
mv avg.dat Zn2Hg2-avg.dat &&
projwfc.x -i Zn2Hg2-pdos.in > Zn2Hg2-pdos.out &&
sleep 10

pp.x      -i Zn2Ir2-pp.in > Zn2Ir2-pp.out &&
dos.x     -i Zn2Ir2-dos.in > Zn2Ir2-dos.out &&
average.x -i Zn2Ir2-wf.ave.in > Zn2Ir2-wf.ave.out &&
mv avg.dat Zn2Ir2-avg.dat &&
projwfc.x -i Zn2Ir2-pdos.in > Zn2Ir2-pdos.out &&
sleep 10

pp.x      -i Zn2La2-pp.in > Zn2La2-pp.out &&
dos.x     -i Zn2La2-dos.in > Zn2La2-dos.out &&
average.x -i Zn2La2-wf.ave.in > Zn2La2-wf.ave.out &&
mv avg.dat Zn2La2-avg.dat &&
projwfc.x -i Zn2La2-pdos.in > Zn2La2-pdos.out &&
sleep 10

pp.x      -i Zn2Mo2-pp.in > Zn2Mo2-pp.out &&
dos.x     -i Zn2Mo2-dos.in > Zn2Mo2-dos.out &&
average.x -i Zn2Mo2-wf.ave.in > Zn2Mo2-wf.ave.out &&
mv avg.dat Zn2Mo2-avg.dat &&
projwfc.x -i Zn2Mo2-pdos.in > Zn2Mo2-pdos.out &&
sleep 10

pp.x      -i Co2Zn2-pp.in > Co2Zn2-pp.out &&
dos.x     -i Co2Zn2-dos.in > Co2Zn2-dos.out &&
average.x -i Co2Zn2-wf.ave.in > Co2Zn2-wf.ave.out &&
mv avg.dat Co2Zn2-avg.dat &&
projwfc.x -i Co2Zn2-pdos.in > Co2Zn2-pdos.out &&
sleep 10

pp.x      -i Zn2Os2-pp.in > Zn2Os2-pp.out &&
dos.x     -i Zn2Os2-dos.in > Zn2Os2-dos.out &&
average.x -i Zn2Os2-wf.ave.in > Zn2Os2-wf.ave.out &&
mv avg.dat Zn2Os2-avg.dat &&
projwfc.x -i Zn2Os2-pdos.in > Zn2Os2-pdos.out &&
sleep 10

pp.x      -i Zn2Pd2-pp.in > Zn2Pd2-pp.out &&
dos.x     -i Zn2Pd2-dos.in > Zn2Pd2-dos.out &&
average.x -i Zn2Pd2-wf.ave.in > Zn2Pd2-wf.ave.out &&
mv avg.dat Zn2Pd2-avg.dat &&
projwfc.x -i Zn2Pd2-pdos.in > Zn2Pd2-pdos.out &&
sleep 10

pp.x      -i Zn2Pt2-pp.in > Zn2Pt2-pp.out &&
dos.x     -i Zn2Pt2-dos.in > Zn2Pt2-dos.out &&
average.x -i Zn2Pt2-wf.ave.in > Zn2Pt2-wf.ave.out &&
mv avg.dat Zn2Pt2-avg.dat &&
projwfc.x -i Zn2Pt2-pdos.in > Zn2Pt2-pdos.out &&
sleep 10

pp.x      -i Zn2Re2-pp.in > Zn2Re2-pp.out &&
dos.x     -i Zn2Re2-dos.in > Zn2Re2-dos.out &&
average.x -i Zn2Re2-wf.ave.in > Zn2Re2-wf.ave.out &&
mv avg.dat Zn2Re2-avg.dat &&
projwfc.x -i Zn2Re2-pdos.in > Zn2Re2-pdos.out &&
sleep 10

pp.x      -i Zn2Rh2-pp.in > Zn2Rh2-pp.out &&
dos.x     -i Zn2Rh2-dos.in > Zn2Rh2-dos.out &&
average.x -i Zn2Rh2-wf.ave.in > Zn2Rh2-wf.ave.out &&
mv avg.dat Zn2Rh2-avg.dat &&
projwfc.x -i Zn2Rh2-pdos.in > Zn2Rh2-pdos.out &&
sleep 10

pp.x      -i Zn2Ta2-pp.in > Zn2Ta2-pp.out &&
dos.x     -i Zn2Ta2-dos.in > Zn2Ta2-dos.out &&
average.x -i Zn2Ta2-wf.ave.in > Zn2Ta2-wf.ave.out &&
mv avg.dat Zn2Ta2-avg.dat &&
projwfc.x -i Zn2Ta2-pdos.in > Zn2Ta2-pdos.out &&
sleep 10

pp.x      -i Ni2Zn2-pp.in > Ni2Zn2-pp.out &&
dos.x     -i Ni2Zn2-dos.in > Ni2Zn2-dos.out &&
average.x -i Ni2Zn2-wf.ave.in > Ni2Zn2-wf.ave.out &&
mv avg.dat Ni2Zn2-avg.dat &&
projwfc.x -i Ni2Zn2-pdos.in > Ni2Zn2-pdos.out &&
sleep 10

pp.x      -i Zn2Tc2-pp.in > Zn2Tc2-pp.out &&
dos.x     -i Zn2Tc2-dos.in > Zn2Tc2-dos.out &&
average.x -i Zn2Tc2-wf.ave.in > Zn2Tc2-wf.ave.out &&
mv avg.dat Zn2Tc2-avg.dat &&
projwfc.x -i Zn2Tc2-pdos.in > Zn2Tc2-pdos.out &&
sleep 10

pp.x      -i Zn2W2-pp.in > Zn2W2-pp.out &&
dos.x     -i Zn2W2-dos.in > Zn2W2-dos.out &&
average.x -i Zn2W2-wf.ave.in > Zn2W2-wf.ave.out &&
mv avg.dat Zn2W2-avg.dat &&
projwfc.x -i Zn2W2-pdos.in > Zn2W2-pdos.out &&
sleep 10

pp.x      -i Zn2Y2-pp.in > Zn2Y2-pp.out &&
dos.x     -i Zn2Y2-dos.in > Zn2Y2-dos.out &&
average.x -i Zn2Y2-wf.ave.in > Zn2Y2-wf.ave.out &&
mv avg.dat Zn2Y2-avg.dat &&
projwfc.x -i Zn2Y2-pdos.in > Zn2Y2-pdos.out &&
sleep 10

pp.x      -i Zn2Zr2-pp.in > Zn2Zr2-pp.out &&
dos.x     -i Zn2Zr2-dos.in > Zn2Zr2-dos.out &&
average.x -i Zn2Zr2-wf.ave.in > Zn2Zr2-wf.ave.out &&
mv avg.dat Zn2Zr2-avg.dat &&
projwfc.x -i Zn2Zr2-pdos.in > Zn2Zr2-pdos.out &&
sleep 10

pp.x      -i Zn2Ru2-pp.in > Zn2Ru2-pp.out &&
dos.x     -i Zn2Ru2-dos.in > Zn2Ru2-dos.out &&
average.x -i Zn2Ru2-wf.ave.in > Zn2Ru2-wf.ave.out &&
mv avg.dat Zn2Ru2-avg.dat &&
projwfc.x -i Zn2Ru2-pdos.in > Zn2Ru2-pdos.out &&
sleep 10

pp.x      -i Zn2Au2-pp.in > Zn2Au2-pp.out &&
dos.x     -i Zn2Au2-dos.in > Zn2Au2-dos.out &&
average.x -i Zn2Au2-wf.ave.in > Zn2Au2-wf.ave.out &&
mv avg.dat Zn2Au2-avg.dat &&
projwfc.x -i Zn2Au2-pdos.in > Zn2Au2-pdos.out &&
sleep 10

pp.x      -i Zn2Nb2-pp.in > Zn2Nb2-pp.out &&
dos.x     -i Zn2Nb2-dos.in > Zn2Nb2-dos.out &&
average.x -i Zn2Nb2-wf.ave.in > Zn2Nb2-wf.ave.out &&
mv avg.dat Zn2Nb2-avg.dat &&
projwfc.x -i Zn2Nb2-pdos.in > Zn2Nb2-pdos.out &&
sleep 10

pp.x      -i Mn2Zn2-pp.in > Mn2Zn2-pp.out &&
dos.x     -i Mn2Zn2-dos.in > Mn2Zn2-dos.out &&
average.x -i Mn2Zn2-wf.ave.in > Mn2Zn2-wf.ave.out &&
mv avg.dat Mn2Zn2-avg.dat &&
projwfc.x -i Mn2Zn2-pdos.in > Mn2Zn2-pdos.out &&
sleep 10

