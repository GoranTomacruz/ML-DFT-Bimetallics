./2022July04_08/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-08##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.08.out     ##CHANGE
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
pp.x      -i Cr2La2-pp.in &&
dos.x     -i Cr2La2-dos.in &&
average.x -i Cr2La2-wf.ave.in > Cr2La2-wf.ave.out &&
mv avg.dat Cr2La2-avg.dat &&
sleep 10

projwfc.x -i Cr2La2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) La.pdos.out.pdos_atm#11\\(La\\)*\(d\) La.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2La2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cu2La2-pp.in &&
dos.x     -i Cu2La2-dos.in &&
average.x -i Cu2La2-wf.ave.in > Cu2La2-wf.ave.out &&
mv avg.dat Cu2La2-avg.dat &&
sleep 10

projwfc.x -i Cu2La2-pdos.in &&
sleep 5

STR = "Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) La.pdos.out.pdos_atm#11\\(La\\)*\(d\) La.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cu2La2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Ag2-pp.in &&
dos.x     -i La2Ag2-dos.in &&
average.x -i La2Ag2-wf.ave.in > La2Ag2-wf.ave.out &&
mv avg.dat La2Ag2-avg.dat &&
sleep 10

projwfc.x -i La2Ag2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Ag.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Ag2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Au2-pp.in &&
dos.x     -i La2Au2-dos.in &&
average.x -i La2Au2-wf.ave.in > La2Au2-wf.ave.out &&
mv avg.dat La2Au2-avg.dat &&
sleep 10

projwfc.x -i La2Au2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Cd2-pp.in &&
dos.x     -i La2Cd2-dos.in &&
average.x -i La2Cd2-wf.ave.in > La2Cd2-wf.ave.out &&
mv avg.dat La2Cd2-avg.dat &&
sleep 10

projwfc.x -i La2Cd2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Cd.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Cd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Hf2-pp.in &&
dos.x     -i La2Hf2-dos.in &&
average.x -i La2Hf2-wf.ave.in > La2Hf2-wf.ave.out &&
mv avg.dat La2Hf2-avg.dat &&
sleep 10

projwfc.x -i La2Hf2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Hg2-pp.in &&
dos.x     -i La2Hg2-dos.in &&
average.x -i La2Hg2-wf.ave.in > La2Hg2-wf.ave.out &&
mv avg.dat La2Hg2-avg.dat &&
sleep 10

projwfc.x -i La2Hg2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Ir2-pp.in &&
dos.x     -i La2Ir2-dos.in &&
average.x -i La2Ir2-wf.ave.in > La2Ir2-wf.ave.out &&
mv avg.dat La2Ir2-avg.dat &&
sleep 10

projwfc.x -i La2Ir2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Mo2-pp.in &&
dos.x     -i La2Mo2-dos.in &&
average.x -i La2Mo2-wf.ave.in > La2Mo2-wf.ave.out &&
mv avg.dat La2Mo2-avg.dat &&
sleep 10

projwfc.x -i La2Mo2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Mo.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Mo2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Nb2-pp.in &&
dos.x     -i La2Nb2-dos.in &&
average.x -i La2Nb2-wf.ave.in > La2Nb2-wf.ave.out &&
mv avg.dat La2Nb2-avg.dat &&
sleep 10

projwfc.x -i La2Nb2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Nb.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Nb2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Os2-pp.in &&
dos.x     -i La2Os2-dos.in &&
average.x -i La2Os2-wf.ave.in > La2Os2-wf.ave.out &&
mv avg.dat La2Os2-avg.dat &&
sleep 10

projwfc.x -i La2Os2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Pd2-pp.in &&
dos.x     -i La2Pd2-dos.in &&
average.x -i La2Pd2-wf.ave.in > La2Pd2-wf.ave.out &&
mv avg.dat La2Pd2-avg.dat &&
sleep 10

projwfc.x -i La2Pd2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Pt2-pp.in &&
dos.x     -i La2Pt2-dos.in &&
average.x -i La2Pt2-wf.ave.in > La2Pt2-wf.ave.out &&
mv avg.dat La2Pt2-avg.dat &&
sleep 10

projwfc.x -i La2Pt2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Re2-pp.in &&
dos.x     -i La2Re2-dos.in &&
average.x -i La2Re2-wf.ave.in > La2Re2-wf.ave.out &&
mv avg.dat La2Re2-avg.dat &&
sleep 10

projwfc.x -i La2Re2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Rh2-pp.in &&
dos.x     -i La2Rh2-dos.in &&
average.x -i La2Rh2-wf.ave.in > La2Rh2-wf.ave.out &&
mv avg.dat La2Rh2-avg.dat &&
sleep 10

projwfc.x -i La2Rh2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Rh.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Rh2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Ru2-pp.in &&
dos.x     -i La2Ru2-dos.in &&
average.x -i La2Ru2-wf.ave.in > La2Ru2-wf.ave.out &&
mv avg.dat La2Ru2-avg.dat &&
sleep 10

projwfc.x -i La2Ru2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Ru.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Ru2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Ta2-pp.in &&
dos.x     -i La2Ta2-dos.in &&
average.x -i La2Ta2-wf.ave.in > La2Ta2-wf.ave.out &&
mv avg.dat La2Ta2-avg.dat &&
sleep 10

projwfc.x -i La2Ta2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Tc2-pp.in &&
dos.x     -i La2Tc2-dos.in &&
average.x -i La2Tc2-wf.ave.in > La2Tc2-wf.ave.out &&
mv avg.dat La2Tc2-avg.dat &&
sleep 10

projwfc.x -i La2Tc2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Tc2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2W2-pp.in &&
dos.x     -i La2W2-dos.in &&
average.x -i La2W2-wf.ave.in > La2W2-wf.ave.out &&
mv avg.dat La2W2-avg.dat &&
sleep 10

projwfc.x -i La2W2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Y2-pp.in &&
dos.x     -i La2Y2-dos.in &&
average.x -i La2Y2-wf.ave.in > La2Y2-wf.ave.out &&
mv avg.dat La2Y2-avg.dat &&
sleep 10

projwfc.x -i La2Y2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i La2Zr2-pp.in &&
dos.x     -i La2Zr2-dos.in &&
average.x -i La2Zr2-wf.ave.in > La2Zr2-wf.ave.out &&
mv avg.dat La2Zr2-avg.dat &&
sleep 10

projwfc.x -i La2Zr2-pdos.in &&
sleep 5

STR = "La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) Zr.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_La2Zr2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2La2-pp.in &&
dos.x     -i Sc2La2-dos.in &&
average.x -i Sc2La2-wf.ave.in > Sc2La2-wf.ave.out &&
mv avg.dat Sc2La2-avg.dat &&
sleep 10

projwfc.x -i Sc2La2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) La.pdos.out.pdos_atm#11\\(La\\)*\(d\) La.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2La2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2La2-pp.in &&
dos.x     -i Ti2La2-dos.in &&
average.x -i Ti2La2-wf.ave.in > Ti2La2-wf.ave.out &&
mv avg.dat Ti2La2-avg.dat &&
sleep 10

projwfc.x -i Ti2La2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) La.pdos.out.pdos_atm#11\\(La\\)*\(d\) La.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2La2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2La2-pp.in &&
dos.x     -i V2La2-dos.in &&
average.x -i V2La2-wf.ave.in > V2La2-wf.ave.out &&
mv avg.dat V2La2-avg.dat &&
sleep 10

projwfc.x -i V2La2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) La.pdos.out.pdos_atm#11\\(La\\)*\(d\) La.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2La2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2La2-pp.in &&
dos.x     -i Zn2La2-dos.in &&
average.x -i Zn2La2-wf.ave.in > Zn2La2-wf.ave.out &&
mv avg.dat Zn2La2-avg.dat &&
sleep 10

projwfc.x -i Zn2La2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) La.pdos.out.pdos_atm#11\\(La\\)*\(d\) La.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2La2_top_layer_\(d\).dat`"
echo $STR

