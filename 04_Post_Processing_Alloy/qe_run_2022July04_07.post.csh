./2022July04_07/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-07##CHANGE
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

STR = "Ag.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ag2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ag2Ta2-pp.in &&
dos.x     -i Ag2Ta2-dos.in &&
average.x -i Ag2Ta2-wf.ave.in > Ag2Ta2-wf.ave.out &&
mv avg.dat Ag2Ta2-avg.dat &&
sleep 10

projwfc.x -i Ag2Ta2-pdos.in &&
sleep 5

STR = "Ag.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ag2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cd2Hf2-pp.in &&
dos.x     -i Cd2Hf2-dos.in &&
average.x -i Cd2Hf2-wf.ave.in > Cd2Hf2-wf.ave.out &&
mv avg.dat Cd2Hf2-avg.dat &&
sleep 10

projwfc.x -i Cd2Hf2-pdos.in &&
sleep 5

STR = "Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cd2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cd2Ta2-pp.in &&
dos.x     -i Cd2Ta2-dos.in &&
average.x -i Cd2Ta2-wf.ave.in > Cd2Ta2-wf.ave.out &&
mv avg.dat Cd2Ta2-avg.dat &&
sleep 10

projwfc.x -i Cd2Ta2-pdos.in &&
sleep 5

STR = "Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cd2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Hf2-pp.in &&
dos.x     -i Cr2Hf2-dos.in &&
average.x -i Cr2Hf2-wf.ave.in > Cr2Hf2-wf.ave.out &&
mv avg.dat Cr2Hf2-avg.dat &&
sleep 10

projwfc.x -i Cr2Hf2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Ta2-pp.in &&
dos.x     -i Cr2Ta2-dos.in &&
average.x -i Cr2Ta2-wf.ave.in > Cr2Ta2-wf.ave.out &&
mv avg.dat Cr2Ta2-avg.dat &&
sleep 10

projwfc.x -i Cr2Ta2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cu2Hf2-pp.in &&
dos.x     -i Cu2Hf2-dos.in &&
average.x -i Cu2Hf2-wf.ave.in > Cu2Hf2-wf.ave.out &&
mv avg.dat Cu2Hf2-avg.dat &&
sleep 10

projwfc.x -i Cu2Hf2-pdos.in &&
sleep 5

STR = "Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cu2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cu2Ta2-pp.in &&
dos.x     -i Cu2Ta2-dos.in &&
average.x -i Cu2Ta2-wf.ave.in > Cu2Ta2-wf.ave.out &&
mv avg.dat Cu2Ta2-avg.dat &&
sleep 10

projwfc.x -i Cu2Ta2-pdos.in &&
sleep 5

STR = "Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cu2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Hf2Au2-pp.in &&
dos.x     -i Hf2Au2-dos.in &&
average.x -i Hf2Au2-wf.ave.in > Hf2Au2-wf.ave.out &&
mv avg.dat Hf2Au2-avg.dat &&
sleep 10

projwfc.x -i Hf2Au2-pdos.in &&
sleep 5

STR = "Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Hf2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Hf2Hg2-pp.in &&
dos.x     -i Hf2Hg2-dos.in &&
average.x -i Hf2Hg2-wf.ave.in > Hf2Hg2-wf.ave.out &&
mv avg.dat Hf2Hg2-avg.dat &&
sleep 10

projwfc.x -i Hf2Hg2-pdos.in &&
sleep 5

STR = "Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Hf2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Hf2Ir2-pp.in &&
dos.x     -i Hf2Ir2-dos.in &&
average.x -i Hf2Ir2-wf.ave.in > Hf2Ir2-wf.ave.out &&
mv avg.dat Hf2Ir2-avg.dat &&
sleep 10

projwfc.x -i Hf2Ir2-pdos.in &&
sleep 5

STR = "Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Hf2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Hf2Os2-pp.in &&
dos.x     -i Hf2Os2-dos.in &&
average.x -i Hf2Os2-wf.ave.in > Hf2Os2-wf.ave.out &&
mv avg.dat Hf2Os2-avg.dat &&
sleep 10

projwfc.x -i Hf2Os2-pdos.in &&
sleep 5

STR = "Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Hf2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Hf2Pt2-pp.in &&
dos.x     -i Hf2Pt2-dos.in &&
average.x -i Hf2Pt2-wf.ave.in > Hf2Pt2-wf.ave.out &&
mv avg.dat Hf2Pt2-avg.dat &&
sleep 10

projwfc.x -i Hf2Pt2-pdos.in &&
sleep 5

STR = "Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Hf2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Hf2Re2-pp.in &&
dos.x     -i Hf2Re2-dos.in &&
average.x -i Hf2Re2-wf.ave.in > Hf2Re2-wf.ave.out &&
mv avg.dat Hf2Re2-avg.dat &&
sleep 10

projwfc.x -i Hf2Re2-pdos.in &&
sleep 5

STR = "Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Hf2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Hf2Ta2-pp.in &&
dos.x     -i Hf2Ta2-dos.in &&
average.x -i Hf2Ta2-wf.ave.in > Hf2Ta2-wf.ave.out &&
mv avg.dat Hf2Ta2-avg.dat &&
sleep 10

projwfc.x -i Hf2Ta2-pdos.in &&
sleep 5

STR = "Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Hf2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Hf2W2-pp.in &&
dos.x     -i Hf2W2-dos.in &&
average.x -i Hf2W2-wf.ave.in > Hf2W2-wf.ave.out &&
mv avg.dat Hf2W2-avg.dat &&
sleep 10

projwfc.x -i Hf2W2-pdos.in &&
sleep 5

STR = "Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Hf2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Hf2Y2-pp.in &&
dos.x     -i Hf2Y2-dos.in &&
average.x -i Hf2Y2-wf.ave.in > Hf2Y2-wf.ave.out &&
mv avg.dat Hf2Y2-avg.dat &&
sleep 10

projwfc.x -i Hf2Y2-pdos.in &&
sleep 5

STR = "Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Hf2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Hf2-pp.in &&
dos.x     -i Mo2Hf2-dos.in &&
average.x -i Mo2Hf2-wf.ave.in > Mo2Hf2-wf.ave.out &&
mv avg.dat Mo2Hf2-avg.dat &&
sleep 10

projwfc.x -i Mo2Hf2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Ta2-pp.in &&
dos.x     -i Mo2Ta2-dos.in &&
average.x -i Mo2Ta2-wf.ave.in > Mo2Ta2-wf.ave.out &&
mv avg.dat Mo2Ta2-avg.dat &&
sleep 10

projwfc.x -i Mo2Ta2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Hf2-pp.in &&
dos.x     -i Nb2Hf2-dos.in &&
average.x -i Nb2Hf2-wf.ave.in > Nb2Hf2-wf.ave.out &&
mv avg.dat Nb2Hf2-avg.dat &&
sleep 10

projwfc.x -i Nb2Hf2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Ta2-pp.in &&
dos.x     -i Nb2Ta2-dos.in &&
average.x -i Nb2Ta2-wf.ave.in > Nb2Ta2-wf.ave.out &&
mv avg.dat Nb2Ta2-avg.dat &&
sleep 10

projwfc.x -i Nb2Ta2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Hf2-pp.in &&
dos.x     -i Pd2Hf2-dos.in &&
average.x -i Pd2Hf2-wf.ave.in > Pd2Hf2-wf.ave.out &&
mv avg.dat Pd2Hf2-avg.dat &&
sleep 10

projwfc.x -i Pd2Hf2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Ta2-pp.in &&
dos.x     -i Pd2Ta2-dos.in &&
average.x -i Pd2Ta2-wf.ave.in > Pd2Ta2-wf.ave.out &&
mv avg.dat Pd2Ta2-avg.dat &&
sleep 10

projwfc.x -i Pd2Ta2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2Hf2-pp.in &&
dos.x     -i Rh2Hf2-dos.in &&
average.x -i Rh2Hf2-wf.ave.in > Rh2Hf2-wf.ave.out &&
mv avg.dat Rh2Hf2-avg.dat &&
sleep 10

projwfc.x -i Rh2Hf2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2Ta2-pp.in &&
dos.x     -i Rh2Ta2-dos.in &&
average.x -i Rh2Ta2-wf.ave.in > Rh2Ta2-wf.ave.out &&
mv avg.dat Rh2Ta2-avg.dat &&
sleep 10

projwfc.x -i Rh2Ta2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ru2Hf2-pp.in &&
dos.x     -i Ru2Hf2-dos.in &&
average.x -i Ru2Hf2-wf.ave.in > Ru2Hf2-wf.ave.out &&
mv avg.dat Ru2Hf2-avg.dat &&
sleep 10

projwfc.x -i Ru2Hf2-pdos.in &&
sleep 5

STR = "Ru.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ru2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ru2Ta2-pp.in &&
dos.x     -i Ru2Ta2-dos.in &&
average.x -i Ru2Ta2-wf.ave.in > Ru2Ta2-wf.ave.out &&
mv avg.dat Ru2Ta2-avg.dat &&
sleep 10

projwfc.x -i Ru2Ta2-pdos.in &&
sleep 5

STR = "Ru.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ru2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Hf2-pp.in &&
dos.x     -i Sc2Hf2-dos.in &&
average.x -i Sc2Hf2-wf.ave.in > Sc2Hf2-wf.ave.out &&
mv avg.dat Sc2Hf2-avg.dat &&
sleep 10

projwfc.x -i Sc2Hf2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Ta2-pp.in &&
dos.x     -i Sc2Ta2-dos.in &&
average.x -i Sc2Ta2-wf.ave.in > Sc2Ta2-wf.ave.out &&
mv avg.dat Sc2Ta2-avg.dat &&
sleep 10

projwfc.x -i Sc2Ta2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ta2Au2-pp.in &&
dos.x     -i Ta2Au2-dos.in &&
average.x -i Ta2Au2-wf.ave.in > Ta2Au2-wf.ave.out &&
mv avg.dat Ta2Au2-avg.dat &&
sleep 10

projwfc.x -i Ta2Au2-pdos.in &&
sleep 5

STR = "Ta.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ta2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ta2Hg2-pp.in &&
dos.x     -i Ta2Hg2-dos.in &&
average.x -i Ta2Hg2-wf.ave.in > Ta2Hg2-wf.ave.out &&
mv avg.dat Ta2Hg2-avg.dat &&
sleep 10

projwfc.x -i Ta2Hg2-pdos.in &&
sleep 5

STR = "Ta.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ta2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ta2Ir2-pp.in &&
dos.x     -i Ta2Ir2-dos.in &&
average.x -i Ta2Ir2-wf.ave.in > Ta2Ir2-wf.ave.out &&
mv avg.dat Ta2Ir2-avg.dat &&
sleep 10

projwfc.x -i Ta2Ir2-pdos.in &&
sleep 5

STR = "Ta.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ta2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ta2Os2-pp.in &&
dos.x     -i Ta2Os2-dos.in &&
average.x -i Ta2Os2-wf.ave.in > Ta2Os2-wf.ave.out &&
mv avg.dat Ta2Os2-avg.dat &&
sleep 10

projwfc.x -i Ta2Os2-pdos.in &&
sleep 5

STR = "Ta.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ta2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ta2Pt2-pp.in &&
dos.x     -i Ta2Pt2-dos.in &&
average.x -i Ta2Pt2-wf.ave.in > Ta2Pt2-wf.ave.out &&
mv avg.dat Ta2Pt2-avg.dat &&
sleep 10

projwfc.x -i Ta2Pt2-pdos.in &&
sleep 5

STR = "Ta.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ta2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ta2Re2-pp.in &&
dos.x     -i Ta2Re2-dos.in &&
average.x -i Ta2Re2-wf.ave.in > Ta2Re2-wf.ave.out &&
mv avg.dat Ta2Re2-avg.dat &&
sleep 10

projwfc.x -i Ta2Re2-pdos.in &&
sleep 5

STR = "Ta.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ta2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ta2W2-pp.in &&
dos.x     -i Ta2W2-dos.in &&
average.x -i Ta2W2-wf.ave.in > Ta2W2-wf.ave.out &&
mv avg.dat Ta2W2-avg.dat &&
sleep 10

projwfc.x -i Ta2W2-pdos.in &&
sleep 5

STR = "Ta.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ta2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Hf2-pp.in &&
dos.x     -i Tc2Hf2-dos.in &&
average.x -i Tc2Hf2-wf.ave.in > Tc2Hf2-wf.ave.out &&
mv avg.dat Tc2Hf2-avg.dat &&
sleep 10

projwfc.x -i Tc2Hf2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Ta2-pp.in &&
dos.x     -i Tc2Ta2-dos.in &&
average.x -i Tc2Ta2-wf.ave.in > Tc2Ta2-wf.ave.out &&
mv avg.dat Tc2Ta2-avg.dat &&
sleep 10

projwfc.x -i Tc2Ta2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Hf2-pp.in &&
dos.x     -i Ti2Hf2-dos.in &&
average.x -i Ti2Hf2-wf.ave.in > Ti2Hf2-wf.ave.out &&
mv avg.dat Ti2Hf2-avg.dat &&
sleep 10

projwfc.x -i Ti2Hf2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Ta2-pp.in &&
dos.x     -i Ti2Ta2-dos.in &&
average.x -i Ti2Ta2-wf.ave.in > Ti2Ta2-wf.ave.out &&
mv avg.dat Ti2Ta2-avg.dat &&
sleep 10

projwfc.x -i Ti2Ta2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Hf2-pp.in &&
dos.x     -i V2Hf2-dos.in &&
average.x -i V2Hf2-wf.ave.in > V2Hf2-wf.ave.out &&
mv avg.dat V2Hf2-avg.dat &&
sleep 10

projwfc.x -i V2Hf2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Ta2-pp.in &&
dos.x     -i V2Ta2-dos.in &&
average.x -i V2Ta2-wf.ave.in > V2Ta2-wf.ave.out &&
mv avg.dat V2Ta2-avg.dat &&
sleep 10

projwfc.x -i V2Ta2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Y2Ta2-pp.in &&
dos.x     -i Y2Ta2-dos.in &&
average.x -i Y2Ta2-wf.ave.in > Y2Ta2-wf.ave.out &&
mv avg.dat Y2Ta2-avg.dat &&
sleep 10

projwfc.x -i Y2Ta2-pdos.in &&
sleep 5

STR = "Y.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Y2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Hf2-pp.in &&
dos.x     -i Zn2Hf2-dos.in &&
average.x -i Zn2Hf2-wf.ave.in > Zn2Hf2-wf.ave.out &&
mv avg.dat Zn2Hf2-avg.dat &&
sleep 10

projwfc.x -i Zn2Hf2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Ta2-pp.in &&
dos.x     -i Zn2Ta2-dos.in &&
average.x -i Zn2Ta2-wf.ave.in > Zn2Ta2-wf.ave.out &&
mv avg.dat Zn2Ta2-avg.dat &&
sleep 10

projwfc.x -i Zn2Ta2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Hf2-pp.in &&
dos.x     -i Zr2Hf2-dos.in &&
average.x -i Zr2Hf2-wf.ave.in > Zr2Hf2-wf.ave.out &&
mv avg.dat Zr2Hf2-avg.dat &&
sleep 10

projwfc.x -i Zr2Hf2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Ta2-pp.in &&
dos.x     -i Zr2Ta2-dos.in &&
average.x -i Zr2Ta2-wf.ave.in > Zr2Ta2-wf.ave.out &&
mv avg.dat Zr2Ta2-avg.dat &&
sleep 10

projwfc.x -i Zr2Ta2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Ta2_top_layer_\(d\).dat`"
echo $STR

