#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-3_##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.3_.out     ##CHANGE
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
pp.x      -i Ag2W2-pp.in &&
dos.x     -i Ag2W2-dos.in &&
average.x -i Ag2W2-wf.ave.in > Ag2W2-wf.ave.out &&
mv avg.dat Ag2W2-avg.dat &&
sleep 10

projwfc.x -i Ag2W2-pdos.in &&
sleep 5

STR = "Ag.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ag2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cd2W2-pp.in &&
dos.x     -i Cd2W2-dos.in &&
average.x -i Cd2W2-wf.ave.in > Cd2W2-wf.ave.out &&
mv avg.dat Cd2W2-avg.dat &&
sleep 10

projwfc.x -i Cd2W2-pdos.in &&
sleep 5

STR = "Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cd2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Pd2-pp.in &&
dos.x     -i Cr2Pd2-dos.in &&
average.x -i Cr2Pd2-wf.ave.in > Cr2Pd2-wf.ave.out &&
mv avg.dat Cr2Pd2-avg.dat &&
sleep 10

projwfc.x -i Cr2Pd2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2W2-pp.in &&
dos.x     -i Cr2W2-dos.in &&
average.x -i Cr2W2-wf.ave.in > Cr2W2-wf.ave.out &&
mv avg.dat Cr2W2-avg.dat &&
sleep 10

projwfc.x -i Cr2W2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cu2Pd2-pp.in &&
dos.x     -i Cu2Pd2-dos.in &&
average.x -i Cu2Pd2-wf.ave.in > Cu2Pd2-wf.ave.out &&
mv avg.dat Cu2Pd2-avg.dat &&
sleep 10

projwfc.x -i Cu2Pd2-pdos.in &&
sleep 5

STR = "Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cu2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cu2W2-pp.in &&
dos.x     -i Cu2W2-dos.in &&
average.x -i Cu2W2-wf.ave.in > Cu2W2-wf.ave.out &&
mv avg.dat Cu2W2-avg.dat &&
sleep 10

projwfc.x -i Cu2W2-pdos.in &&
sleep 5

STR = "Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cu2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Pd2-pp.in &&
dos.x     -i Mo2Pd2-dos.in &&
average.x -i Mo2Pd2-wf.ave.in > Mo2Pd2-wf.ave.out &&
mv avg.dat Mo2Pd2-avg.dat &&
sleep 10

projwfc.x -i Mo2Pd2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2W2-pp.in &&
dos.x     -i Mo2W2-dos.in &&
average.x -i Mo2W2-wf.ave.in > Mo2W2-wf.ave.out &&
mv avg.dat Mo2W2-avg.dat &&
sleep 10

projwfc.x -i Mo2W2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Pd2-pp.in &&
dos.x     -i Nb2Pd2-dos.in &&
average.x -i Nb2Pd2-wf.ave.in > Nb2Pd2-wf.ave.out &&
mv avg.dat Nb2Pd2-avg.dat &&
sleep 10

projwfc.x -i Nb2Pd2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2W2-pp.in &&
dos.x     -i Nb2W2-dos.in &&
average.x -i Nb2W2-wf.ave.in > Nb2W2-wf.ave.out &&
mv avg.dat Nb2W2-avg.dat &&
sleep 10

projwfc.x -i Nb2W2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Ag2-pp.in &&
dos.x     -i Pd2Ag2-dos.in &&
average.x -i Pd2Ag2-wf.ave.in > Pd2Ag2-wf.ave.out &&
mv avg.dat Pd2Ag2-avg.dat &&
sleep 10

projwfc.x -i Pd2Ag2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Ag.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Ag2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Au2-pp.in &&
dos.x     -i Pd2Au2-dos.in &&
average.x -i Pd2Au2-wf.ave.in > Pd2Au2-wf.ave.out &&
mv avg.dat Pd2Au2-avg.dat &&
sleep 10

projwfc.x -i Pd2Au2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Cd2-pp.in &&
dos.x     -i Pd2Cd2-dos.in &&
average.x -i Pd2Cd2-wf.ave.in > Pd2Cd2-wf.ave.out &&
mv avg.dat Pd2Cd2-avg.dat &&
sleep 10

projwfc.x -i Pd2Cd2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Cd.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Cd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Hg2-pp.in &&
dos.x     -i Pd2Hg2-dos.in &&
average.x -i Pd2Hg2-wf.ave.in > Pd2Hg2-wf.ave.out &&
mv avg.dat Pd2Hg2-avg.dat &&
sleep 10

projwfc.x -i Pd2Hg2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Ir2-pp.in &&
dos.x     -i Pd2Ir2-dos.in &&
average.x -i Pd2Ir2-wf.ave.in > Pd2Ir2-wf.ave.out &&
mv avg.dat Pd2Ir2-avg.dat &&
sleep 10

projwfc.x -i Pd2Ir2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Os2-pp.in &&
dos.x     -i Pd2Os2-dos.in &&
average.x -i Pd2Os2-wf.ave.in > Pd2Os2-wf.ave.out &&
mv avg.dat Pd2Os2-avg.dat &&
sleep 10

projwfc.x -i Pd2Os2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Pt2-pp.in &&
dos.x     -i Pd2Pt2-dos.in &&
average.x -i Pd2Pt2-wf.ave.in > Pd2Pt2-wf.ave.out &&
mv avg.dat Pd2Pt2-avg.dat &&
sleep 10

projwfc.x -i Pd2Pt2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Re2-pp.in &&
dos.x     -i Pd2Re2-dos.in &&
average.x -i Pd2Re2-wf.ave.in > Pd2Re2-wf.ave.out &&
mv avg.dat Pd2Re2-avg.dat &&
sleep 10

projwfc.x -i Pd2Re2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2W2-pp.in &&
dos.x     -i Pd2W2-dos.in &&
average.x -i Pd2W2-wf.ave.in > Pd2W2-wf.ave.out &&
mv avg.dat Pd2W2-avg.dat &&
sleep 10

projwfc.x -i Pd2W2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pd2Y2-pp.in &&
dos.x     -i Pd2Y2-dos.in &&
average.x -i Pd2Y2-wf.ave.in > Pd2Y2-wf.ave.out &&
mv avg.dat Pd2Y2-avg.dat &&
sleep 10

projwfc.x -i Pd2Y2-pdos.in &&
sleep 5

STR = "Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pd2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2Pd2-pp.in &&
dos.x     -i Rh2Pd2-dos.in &&
average.x -i Rh2Pd2-wf.ave.in > Rh2Pd2-wf.ave.out &&
mv avg.dat Rh2Pd2-avg.dat &&
sleep 10

projwfc.x -i Rh2Pd2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2W2-pp.in &&
dos.x     -i Rh2W2-dos.in &&
average.x -i Rh2W2-wf.ave.in > Rh2W2-wf.ave.out &&
mv avg.dat Rh2W2-avg.dat &&
sleep 10

projwfc.x -i Rh2W2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ru2Pd2-pp.in &&
dos.x     -i Ru2Pd2-dos.in &&
average.x -i Ru2Pd2-wf.ave.in > Ru2Pd2-wf.ave.out &&
mv avg.dat Ru2Pd2-avg.dat &&
sleep 10

projwfc.x -i Ru2Pd2-pdos.in &&
sleep 5

STR = "Ru.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ru2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ru2W2-pp.in &&
dos.x     -i Ru2W2-dos.in &&
average.x -i Ru2W2-wf.ave.in > Ru2W2-wf.ave.out &&
mv avg.dat Ru2W2-avg.dat &&
sleep 10

projwfc.x -i Ru2W2-pdos.in &&
sleep 5

STR = "Ru.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ru2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Pd2-pp.in &&
dos.x     -i Sc2Pd2-dos.in &&
average.x -i Sc2Pd2-wf.ave.in > Sc2Pd2-wf.ave.out &&
mv avg.dat Sc2Pd2-avg.dat &&
sleep 10

projwfc.x -i Sc2Pd2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2V2-pp.in &&
dos.x     -i Sc2V2-dos.in &&
average.x -i Sc2V2-wf.ave.in > Sc2V2-wf.ave.out &&
mv avg.dat Sc2V2-avg.dat &&
sleep 10

projwfc.x -i Sc2V2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) V.pdos.out.pdos_atm#11\\(V\\)*\(d\) V.pdos.out.pdos_atm#12\\(V\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2V2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2W2-pp.in &&
dos.x     -i Sc2W2-dos.in &&
average.x -i Sc2W2-wf.ave.in > Sc2W2-wf.ave.out &&
mv avg.dat Sc2W2-avg.dat &&
sleep 10

projwfc.x -i Sc2W2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Pd2-pp.in &&
dos.x     -i Tc2Pd2-dos.in &&
average.x -i Tc2Pd2-wf.ave.in > Tc2Pd2-wf.ave.out &&
mv avg.dat Tc2Pd2-avg.dat &&
sleep 10

projwfc.x -i Tc2Pd2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2W2-pp.in &&
dos.x     -i Tc2W2-dos.in &&
average.x -i Tc2W2-wf.ave.in > Tc2W2-wf.ave.out &&
mv avg.dat Tc2W2-avg.dat &&
sleep 10

projwfc.x -i Tc2W2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Pd2-pp.in &&
dos.x     -i Ti2Pd2-dos.in &&
average.x -i Ti2Pd2-wf.ave.in > Ti2Pd2-wf.ave.out &&
mv avg.dat Ti2Pd2-avg.dat &&
sleep 10

projwfc.x -i Ti2Pd2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2V2-pp.in &&
dos.x     -i Ti2V2-dos.in &&
average.x -i Ti2V2-wf.ave.in > Ti2V2-wf.ave.out &&
mv avg.dat Ti2V2-avg.dat &&
sleep 10

projwfc.x -i Ti2V2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) V.pdos.out.pdos_atm#11\\(V\\)*\(d\) V.pdos.out.pdos_atm#12\\(V\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2V2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2W2-pp.in &&
dos.x     -i Ti2W2-dos.in &&
average.x -i Ti2W2-wf.ave.in > Ti2W2-wf.ave.out &&
mv avg.dat Ti2W2-avg.dat &&
sleep 10

projwfc.x -i Ti2W2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Ag2-pp.in &&
dos.x     -i V2Ag2-dos.in &&
average.x -i V2Ag2-wf.ave.in > V2Ag2-wf.ave.out &&
mv avg.dat V2Ag2-avg.dat &&
sleep 10

projwfc.x -i V2Ag2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Ag.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Ag2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Au2-pp.in &&
dos.x     -i V2Au2-dos.in &&
average.x -i V2Au2-wf.ave.in > V2Au2-wf.ave.out &&
mv avg.dat V2Au2-avg.dat &&
sleep 10

projwfc.x -i V2Au2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Cd2-pp.in &&
dos.x     -i V2Cd2-dos.in &&
average.x -i V2Cd2-wf.ave.in > V2Cd2-wf.ave.out &&
mv avg.dat V2Cd2-avg.dat &&
sleep 10

projwfc.x -i V2Cd2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Cd.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Cd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Cr2-pp.in &&
dos.x     -i V2Cr2-dos.in &&
average.x -i V2Cr2-wf.ave.in > V2Cr2-wf.ave.out &&
mv avg.dat V2Cr2-avg.dat &&
sleep 10

projwfc.x -i V2Cr2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Cr.pdos.out.pdos_atm#11\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#12\\(Cr\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Cr2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Cu2-pp.in &&
dos.x     -i V2Cu2-dos.in &&
average.x -i V2Cu2-wf.ave.in > V2Cu2-wf.ave.out &&
mv avg.dat V2Cu2-avg.dat &&
sleep 10

projwfc.x -i V2Cu2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Cu.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Cu2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Hg2-pp.in &&
dos.x     -i V2Hg2-dos.in &&
average.x -i V2Hg2-wf.ave.in > V2Hg2-wf.ave.out &&
mv avg.dat V2Hg2-avg.dat &&
sleep 10

projwfc.x -i V2Hg2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Ir2-pp.in &&
dos.x     -i V2Ir2-dos.in &&
average.x -i V2Ir2-wf.ave.in > V2Ir2-wf.ave.out &&
mv avg.dat V2Ir2-avg.dat &&
sleep 10

projwfc.x -i V2Ir2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Mo2-pp.in &&
dos.x     -i V2Mo2-dos.in &&
average.x -i V2Mo2-wf.ave.in > V2Mo2-wf.ave.out &&
mv avg.dat V2Mo2-avg.dat &&
sleep 10

projwfc.x -i V2Mo2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Mo.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Mo2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Nb2-pp.in &&
dos.x     -i V2Nb2-dos.in &&
average.x -i V2Nb2-wf.ave.in > V2Nb2-wf.ave.out &&
mv avg.dat V2Nb2-avg.dat &&
sleep 10

projwfc.x -i V2Nb2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Nb.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Nb2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Os2-pp.in &&
dos.x     -i V2Os2-dos.in &&
average.x -i V2Os2-wf.ave.in > V2Os2-wf.ave.out &&
mv avg.dat V2Os2-avg.dat &&
sleep 10

projwfc.x -i V2Os2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Pd2-pp.in &&
dos.x     -i V2Pd2-dos.in &&
average.x -i V2Pd2-wf.ave.in > V2Pd2-wf.ave.out &&
mv avg.dat V2Pd2-avg.dat &&
sleep 10

projwfc.x -i V2Pd2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Pt2-pp.in &&
dos.x     -i V2Pt2-dos.in &&
average.x -i V2Pt2-wf.ave.in > V2Pt2-wf.ave.out &&
mv avg.dat V2Pt2-avg.dat &&
sleep 10

projwfc.x -i V2Pt2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Re2-pp.in &&
dos.x     -i V2Re2-dos.in &&
average.x -i V2Re2-wf.ave.in > V2Re2-wf.ave.out &&
mv avg.dat V2Re2-avg.dat &&
sleep 10

projwfc.x -i V2Re2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Rh2-pp.in &&
dos.x     -i V2Rh2-dos.in &&
average.x -i V2Rh2-wf.ave.in > V2Rh2-wf.ave.out &&
mv avg.dat V2Rh2-avg.dat &&
sleep 10

projwfc.x -i V2Rh2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Rh.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Rh2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Ru2-pp.in &&
dos.x     -i V2Ru2-dos.in &&
average.x -i V2Ru2-wf.ave.in > V2Ru2-wf.ave.out &&
mv avg.dat V2Ru2-avg.dat &&
sleep 10

projwfc.x -i V2Ru2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Ru.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Ru2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Tc2-pp.in &&
dos.x     -i V2Tc2-dos.in &&
average.x -i V2Tc2-wf.ave.in > V2Tc2-wf.ave.out &&
mv avg.dat V2Tc2-avg.dat &&
sleep 10

projwfc.x -i V2Tc2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Tc2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2W2-pp.in &&
dos.x     -i V2W2-dos.in &&
average.x -i V2W2-wf.ave.in > V2W2-wf.ave.out &&
mv avg.dat V2W2-avg.dat &&
sleep 10

projwfc.x -i V2W2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Y2-pp.in &&
dos.x     -i V2Y2-dos.in &&
average.x -i V2Y2-wf.ave.in > V2Y2-wf.ave.out &&
mv avg.dat V2Y2-avg.dat &&
sleep 10

projwfc.x -i V2Y2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Zn2-pp.in &&
dos.x     -i V2Zn2-dos.in &&
average.x -i V2Zn2-wf.ave.in > V2Zn2-wf.ave.out &&
mv avg.dat V2Zn2-avg.dat &&
sleep 10

projwfc.x -i V2Zn2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Zn.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Zn2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i V2Zr2-pp.in &&
dos.x     -i V2Zr2-dos.in &&
average.x -i V2Zr2-wf.ave.in > V2Zr2-wf.ave.out &&
mv avg.dat V2Zr2-avg.dat &&
sleep 10

projwfc.x -i V2Zr2-pdos.in &&
sleep 5

STR = "V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) Zr.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_V2Zr2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i W2Au2-pp.in &&
dos.x     -i W2Au2-dos.in &&
average.x -i W2Au2-wf.ave.in > W2Au2-wf.ave.out &&
mv avg.dat W2Au2-avg.dat &&
sleep 10

projwfc.x -i W2Au2-pdos.in &&
sleep 5

STR = "W.pdos.out.pdos_atm#9\\(W\\)*\(d\) W.pdos.out.pdos_atm#10\\(W\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_W2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i W2Hg2-pp.in &&
dos.x     -i W2Hg2-dos.in &&
average.x -i W2Hg2-wf.ave.in > W2Hg2-wf.ave.out &&
mv avg.dat W2Hg2-avg.dat &&
sleep 10

projwfc.x -i W2Hg2-pdos.in &&
sleep 5

STR = "W.pdos.out.pdos_atm#9\\(W\\)*\(d\) W.pdos.out.pdos_atm#10\\(W\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_W2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i W2Ir2-pp.in &&
dos.x     -i W2Ir2-dos.in &&
average.x -i W2Ir2-wf.ave.in > W2Ir2-wf.ave.out &&
mv avg.dat W2Ir2-avg.dat &&
sleep 10

projwfc.x -i W2Ir2-pdos.in &&
sleep 5

STR = "W.pdos.out.pdos_atm#9\\(W\\)*\(d\) W.pdos.out.pdos_atm#10\\(W\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_W2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i W2Os2-pp.in &&
dos.x     -i W2Os2-dos.in &&
average.x -i W2Os2-wf.ave.in > W2Os2-wf.ave.out &&
mv avg.dat W2Os2-avg.dat &&
sleep 10

projwfc.x -i W2Os2-pdos.in &&
sleep 5

STR = "W.pdos.out.pdos_atm#9\\(W\\)*\(d\) W.pdos.out.pdos_atm#10\\(W\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_W2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i W2Pt2-pp.in &&
dos.x     -i W2Pt2-dos.in &&
average.x -i W2Pt2-wf.ave.in > W2Pt2-wf.ave.out &&
mv avg.dat W2Pt2-avg.dat &&
sleep 10

projwfc.x -i W2Pt2-pdos.in &&
sleep 5

STR = "W.pdos.out.pdos_atm#9\\(W\\)*\(d\) W.pdos.out.pdos_atm#10\\(W\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_W2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i W2Re2-pp.in &&
dos.x     -i W2Re2-dos.in &&
average.x -i W2Re2-wf.ave.in > W2Re2-wf.ave.out &&
mv avg.dat W2Re2-avg.dat &&
sleep 10

projwfc.x -i W2Re2-pdos.in &&
sleep 5

STR = "W.pdos.out.pdos_atm#9\\(W\\)*\(d\) W.pdos.out.pdos_atm#10\\(W\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_W2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Y2W2-pp.in &&
dos.x     -i Y2W2-dos.in &&
average.x -i Y2W2-wf.ave.in > Y2W2-wf.ave.out &&
mv avg.dat Y2W2-avg.dat &&
sleep 10

projwfc.x -i Y2W2-pdos.in &&
sleep 5

STR = "Y.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#10\\(Y\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Y2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Pd2-pp.in &&
dos.x     -i Zn2Pd2-dos.in &&
average.x -i Zn2Pd2-wf.ave.in > Zn2Pd2-wf.ave.out &&
mv avg.dat Zn2Pd2-avg.dat &&
sleep 10

projwfc.x -i Zn2Pd2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2W2-pp.in &&
dos.x     -i Zn2W2-dos.in &&
average.x -i Zn2W2-wf.ave.in > Zn2W2-wf.ave.out &&
mv avg.dat Zn2W2-avg.dat &&
sleep 10

projwfc.x -i Zn2W2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2W2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Pd2-pp.in &&
dos.x     -i Zr2Pd2-dos.in &&
average.x -i Zr2Pd2-wf.ave.in > Zr2Pd2-wf.ave.out &&
mv avg.dat Zr2Pd2-avg.dat &&
sleep 10

projwfc.x -i Zr2Pd2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Pd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2W2-pp.in &&
dos.x     -i Zr2W2-dos.in &&
average.x -i Zr2W2-wf.ave.in > Zr2W2-wf.ave.out &&
mv avg.dat Zr2W2-avg.dat &&
sleep 10

projwfc.x -i Zr2W2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2W2_top_layer_\(d\).dat`"
echo $STR

