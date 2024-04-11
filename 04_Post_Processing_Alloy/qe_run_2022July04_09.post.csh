./2022July04_09/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-09##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.09.out     ##CHANGE
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
pp.x      -i Cr2Ni2-pp.in &&
dos.x     -i Cr2Ni2-dos.in &&
average.x -i Cr2Ni2-wf.ave.in > Cr2Ni2-wf.ave.out &&
mv avg.dat Cr2Ni2-avg.dat &&
sleep 10

projwfc.x -i Cr2Ni2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Ni.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Ni2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Ag2-pp.in &&
dos.x     -i Ni2Ag2-dos.in &&
average.x -i Ni2Ag2-wf.ave.in > Ni2Ag2-wf.ave.out &&
mv avg.dat Ni2Ag2-avg.dat &&
sleep 10

projwfc.x -i Ni2Ag2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ag.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Ag2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Au2-pp.in &&
dos.x     -i Ni2Au2-dos.in &&
average.x -i Ni2Au2-wf.ave.in > Ni2Au2-wf.ave.out &&
mv avg.dat Ni2Au2-avg.dat &&
sleep 10

projwfc.x -i Ni2Au2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Cd2-pp.in &&
dos.x     -i Ni2Cd2-dos.in &&
average.x -i Ni2Cd2-wf.ave.in > Ni2Cd2-wf.ave.out &&
mv avg.dat Ni2Cd2-avg.dat &&
sleep 10

projwfc.x -i Ni2Cd2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Cd.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Cd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Cu2-pp.in &&
dos.x     -i Ni2Cu2-dos.in &&
average.x -i Ni2Cu2-wf.ave.in > Ni2Cu2-wf.ave.out &&
mv avg.dat Ni2Cu2-avg.dat &&
sleep 10

projwfc.x -i Ni2Cu2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Cu.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Cu2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Hf2-pp.in &&
dos.x     -i Ni2Hf2-dos.in &&
average.x -i Ni2Hf2-wf.ave.in > Ni2Hf2-wf.ave.out &&
mv avg.dat Ni2Hf2-avg.dat &&
sleep 10

projwfc.x -i Ni2Hf2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Hg2-pp.in &&
dos.x     -i Ni2Hg2-dos.in &&
average.x -i Ni2Hg2-wf.ave.in > Ni2Hg2-wf.ave.out &&
mv avg.dat Ni2Hg2-avg.dat &&
sleep 10

projwfc.x -i Ni2Hg2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Ir2-pp.in &&
dos.x     -i Ni2Ir2-dos.in &&
average.x -i Ni2Ir2-wf.ave.in > Ni2Ir2-wf.ave.out &&
mv avg.dat Ni2Ir2-avg.dat &&
sleep 10

projwfc.x -i Ni2Ir2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2La2-pp.in &&
dos.x     -i Ni2La2-dos.in &&
average.x -i Ni2La2-wf.ave.in > Ni2La2-wf.ave.out &&
mv avg.dat Ni2La2-avg.dat &&
sleep 10

projwfc.x -i Ni2La2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) La.pdos.out.pdos_atm#11\\(La\\)*\(d\) La.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2La2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Mo2-pp.in &&
dos.x     -i Ni2Mo2-dos.in &&
average.x -i Ni2Mo2-wf.ave.in > Ni2Mo2-wf.ave.out &&
mv avg.dat Ni2Mo2-avg.dat &&
sleep 10

projwfc.x -i Ni2Mo2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Mo.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Mo2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Nb2-pp.in &&
dos.x     -i Ni2Nb2-dos.in &&
average.x -i Ni2Nb2-wf.ave.in > Ni2Nb2-wf.ave.out &&
mv avg.dat Ni2Nb2-avg.dat &&
sleep 10

projwfc.x -i Ni2Nb2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Nb.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Nb2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Os2-pp.in &&
dos.x     -i Ni2Os2-dos.in &&
average.x -i Ni2Os2-wf.ave.in > Ni2Os2-wf.ave.out &&
mv avg.dat Ni2Os2-avg.dat &&
sleep 10

projwfc.x -i Ni2Os2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Pd2-pp.in &&
dos.x     -i Ni2Pd2-dos.in &&
average.x -i Ni2Pd2-wf.ave.in > Ni2Pd2-wf.ave.out &&
mv avg.dat Ni2Pd2-avg.dat &&
sleep 10

projwfc.x -i Ni2Pd2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Pt2-pp.in &&
dos.x     -i Ni2Pt2-dos.in &&
average.x -i Ni2Pt2-wf.ave.in > Ni2Pt2-wf.ave.out &&
mv avg.dat Ni2Pt2-avg.dat &&
sleep 10

projwfc.x -i Ni2Pt2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Re2-pp.in &&
dos.x     -i Ni2Re2-dos.in &&
average.x -i Ni2Re2-wf.ave.in > Ni2Re2-wf.ave.out &&
mv avg.dat Ni2Re2-avg.dat &&
sleep 10

projwfc.x -i Ni2Re2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Rh2-pp.in &&
dos.x     -i Ni2Rh2-dos.in &&
average.x -i Ni2Rh2-wf.ave.in > Ni2Rh2-wf.ave.out &&
mv avg.dat Ni2Rh2-avg.dat &&
sleep 10

projwfc.x -i Ni2Rh2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Rh.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Rh2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Ru2-pp.in &&
dos.x     -i Ni2Ru2-dos.in &&
average.x -i Ni2Ru2-wf.ave.in > Ni2Ru2-wf.ave.out &&
mv avg.dat Ni2Ru2-avg.dat &&
sleep 10

projwfc.x -i Ni2Ru2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ru.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Ru2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Ta2-pp.in &&
dos.x     -i Ni2Ta2-dos.in &&
average.x -i Ni2Ta2-wf.ave.in > Ni2Ta2-wf.ave.out &&
mv avg.dat Ni2Ta2-avg.dat &&
sleep 10

projwfc.x -i Ni2Ta2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2W2-pp.in &&
dos.x     -i Ni2W2-dos.in &&
average.x -i Ni2W2-wf.ave.in > Ni2W2-wf.ave.out &&
mv avg.dat Ni2W2-avg.dat &&
sleep 10

projwfc.x -i Ni2W2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Y2-pp.in &&
dos.x     -i Ni2Y2-dos.in &&
average.x -i Ni2Y2-wf.ave.in > Ni2Y2-wf.ave.out &&
mv avg.dat Ni2Y2-avg.dat &&
sleep 10

projwfc.x -i Ni2Y2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Zn2-pp.in &&
dos.x     -i Ni2Zn2-dos.in &&
average.x -i Ni2Zn2-wf.ave.in > Ni2Zn2-wf.ave.out &&
mv avg.dat Ni2Zn2-avg.dat &&
sleep 10

projwfc.x -i Ni2Zn2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Zn.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Zn2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ni2Zr2-pp.in &&
dos.x     -i Ni2Zr2-dos.in &&
average.x -i Ni2Zr2-wf.ave.in > Ni2Zr2-wf.ave.out &&
mv avg.dat Ni2Zr2-avg.dat &&
sleep 10

projwfc.x -i Ni2Zr2-pdos.in &&
sleep 5

STR = "Ni.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Zr.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ni2Zr2_top_layer_\(d\).dat`"
echo $STR

