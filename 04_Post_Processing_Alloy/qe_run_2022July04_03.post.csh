./2022July04_03/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-03##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.03.out     ##CHANGE
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
pp.x      -i Ag2Pt2-pp.in &&
dos.x     -i Ag2Pt2-dos.in &&
average.x -i Ag2Pt2-wf.ave.in > Ag2Pt2-wf.ave.out &&
mv avg.dat Ag2Pt2-avg.dat &&
sleep 10

projwfc.x -i Ag2Pt2-pdos.in &&
sleep 5

STR = "Ag.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ag2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ag2Re2-pp.in &&
dos.x     -i Ag2Re2-dos.in &&
average.x -i Ag2Re2-wf.ave.in > Ag2Re2-wf.ave.out &&
mv avg.dat Ag2Re2-avg.dat &&
sleep 10

projwfc.x -i Ag2Re2-pdos.in &&
sleep 5

STR = "Ag.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ag2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cd2Pt2-pp.in &&
dos.x     -i Cd2Pt2-dos.in &&
average.x -i Cd2Pt2-wf.ave.in > Cd2Pt2-wf.ave.out &&
mv avg.dat Cd2Pt2-avg.dat &&
sleep 10

projwfc.x -i Cd2Pt2-pdos.in &&
sleep 5

STR = "Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cd2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cd2Re2-pp.in &&
dos.x     -i Cd2Re2-dos.in &&
average.x -i Cd2Re2-wf.ave.in > Cd2Re2-wf.ave.out &&
mv avg.dat Cd2Re2-avg.dat &&
sleep 10

projwfc.x -i Cd2Re2-pdos.in &&
sleep 5

STR = "Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cd2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Pt2-pp.in &&
dos.x     -i Cr2Pt2-dos.in &&
average.x -i Cr2Pt2-wf.ave.in > Cr2Pt2-wf.ave.out &&
mv avg.dat Cr2Pt2-avg.dat &&
sleep 10

projwfc.x -i Cr2Pt2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Re2-pp.in &&
dos.x     -i Cr2Re2-dos.in &&
average.x -i Cr2Re2-wf.ave.in > Cr2Re2-wf.ave.out &&
mv avg.dat Cr2Re2-avg.dat &&
sleep 10

projwfc.x -i Cr2Re2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cu2Pt2-pp.in &&
dos.x     -i Cu2Pt2-dos.in &&
average.x -i Cu2Pt2-wf.ave.in > Cu2Pt2-wf.ave.out &&
mv avg.dat Cu2Pt2-avg.dat &&
sleep 10

projwfc.x -i Cu2Pt2-pdos.in &&
sleep 5

STR = "Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cu2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cu2Re2-pp.in &&
dos.x     -i Cu2Re2-dos.in &&
average.x -i Cu2Re2-wf.ave.in > Cu2Re2-wf.ave.out &&
mv avg.dat Cu2Re2-avg.dat &&
sleep 10

projwfc.x -i Cu2Re2-pdos.in &&
sleep 5

STR = "Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cu2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Pt2-pp.in &&
dos.x     -i Mo2Pt2-dos.in &&
average.x -i Mo2Pt2-wf.ave.in > Mo2Pt2-wf.ave.out &&
mv avg.dat Mo2Pt2-avg.dat &&
sleep 10

projwfc.x -i Mo2Pt2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Re2-pp.in &&
dos.x     -i Mo2Re2-dos.in &&
average.x -i Mo2Re2-wf.ave.in > Mo2Re2-wf.ave.out &&
mv avg.dat Mo2Re2-avg.dat &&
sleep 10

projwfc.x -i Mo2Re2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Pt2-pp.in &&
dos.x     -i Nb2Pt2-dos.in &&
average.x -i Nb2Pt2-wf.ave.in > Nb2Pt2-wf.ave.out &&
mv avg.dat Nb2Pt2-avg.dat &&
sleep 10

projwfc.x -i Nb2Pt2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Re2-pp.in &&
dos.x     -i Nb2Re2-dos.in &&
average.x -i Nb2Re2-wf.ave.in > Nb2Re2-wf.ave.out &&
mv avg.dat Nb2Re2-avg.dat &&
sleep 10

projwfc.x -i Nb2Re2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Os2Pt2-pp.in &&
dos.x     -i Os2Pt2-dos.in &&
average.x -i Os2Pt2-wf.ave.in > Os2Pt2-wf.ave.out &&
mv avg.dat Os2Pt2-avg.dat &&
sleep 10

projwfc.x -i Os2Pt2-pdos.in &&
sleep 5

STR = "Os.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Os2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pt2Au2-pp.in &&
dos.x     -i Pt2Au2-dos.in &&
average.x -i Pt2Au2-wf.ave.in > Pt2Au2-wf.ave.out &&
mv avg.dat Pt2Au2-avg.dat &&
sleep 10

projwfc.x -i Pt2Au2-pdos.in &&
sleep 5

STR = "Pt.pdos.out.pdos_atm#9\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#10\\(Pt\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pt2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Pt2Hg2-pp.in &&
dos.x     -i Pt2Hg2-dos.in &&
average.x -i Pt2Hg2-wf.ave.in > Pt2Hg2-wf.ave.out &&
mv avg.dat Pt2Hg2-avg.dat &&
sleep 10

projwfc.x -i Pt2Hg2-pdos.in &&
sleep 5

STR = "Pt.pdos.out.pdos_atm#9\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#10\\(Pt\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Pt2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Re2Au2-pp.in &&
dos.x     -i Re2Au2-dos.in &&
average.x -i Re2Au2-wf.ave.in > Re2Au2-wf.ave.out &&
mv avg.dat Re2Au2-avg.dat &&
sleep 10

projwfc.x -i Re2Au2-pdos.in &&
sleep 5

STR = "Re.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Re2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Re2Hg2-pp.in &&
dos.x     -i Re2Hg2-dos.in &&
average.x -i Re2Hg2-wf.ave.in > Re2Hg2-wf.ave.out &&
mv avg.dat Re2Hg2-avg.dat &&
sleep 10

projwfc.x -i Re2Hg2-pdos.in &&
sleep 5

STR = "Re.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Re2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Re2Os2-pp.in &&
dos.x     -i Re2Os2-dos.in &&
average.x -i Re2Os2-wf.ave.in > Re2Os2-wf.ave.out &&
mv avg.dat Re2Os2-avg.dat &&
sleep 10

projwfc.x -i Re2Os2-pdos.in &&
sleep 5

STR = "Re.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Re2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Re2Pt2-pp.in &&
dos.x     -i Re2Pt2-dos.in &&
average.x -i Re2Pt2-wf.ave.in > Re2Pt2-wf.ave.out &&
mv avg.dat Re2Pt2-avg.dat &&
sleep 10

projwfc.x -i Re2Pt2-pdos.in &&
sleep 5

STR = "Re.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Re2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2Pt2-pp.in &&
dos.x     -i Rh2Pt2-dos.in &&
average.x -i Rh2Pt2-wf.ave.in > Rh2Pt2-wf.ave.out &&
mv avg.dat Rh2Pt2-avg.dat &&
sleep 10

projwfc.x -i Rh2Pt2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2Re2-pp.in &&
dos.x     -i Rh2Re2-dos.in &&
average.x -i Rh2Re2-wf.ave.in > Rh2Re2-wf.ave.out &&
mv avg.dat Rh2Re2-avg.dat &&
sleep 10

projwfc.x -i Rh2Re2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ru2Pt2-pp.in &&
dos.x     -i Ru2Pt2-dos.in &&
average.x -i Ru2Pt2-wf.ave.in > Ru2Pt2-wf.ave.out &&
mv avg.dat Ru2Pt2-avg.dat &&
sleep 10

projwfc.x -i Ru2Pt2-pdos.in &&
sleep 5

STR = "Ru.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ru2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ru2Re2-pp.in &&
dos.x     -i Ru2Re2-dos.in &&
average.x -i Ru2Re2-wf.ave.in > Ru2Re2-wf.ave.out &&
mv avg.dat Ru2Re2-avg.dat &&
sleep 10

projwfc.x -i Ru2Re2-pdos.in &&
sleep 5

STR = "Ru.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ru2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Pt2-pp.in &&
dos.x     -i Sc2Pt2-dos.in &&
average.x -i Sc2Pt2-wf.ave.in > Sc2Pt2-wf.ave.out &&
mv avg.dat Sc2Pt2-avg.dat &&
sleep 10

projwfc.x -i Sc2Pt2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Re2-pp.in &&
dos.x     -i Sc2Re2-dos.in &&
average.x -i Sc2Re2-wf.ave.in > Sc2Re2-wf.ave.out &&
mv avg.dat Sc2Re2-avg.dat &&
sleep 10

projwfc.x -i Sc2Re2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Ti2-pp.in &&
dos.x     -i Sc2Ti2-dos.in &&
average.x -i Sc2Ti2-wf.ave.in > Sc2Ti2-wf.ave.out &&
mv avg.dat Sc2Ti2-avg.dat &&
sleep 10

projwfc.x -i Sc2Ti2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Ti.pdos.out.pdos_atm#11\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#12\\(Ti\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Ti2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Ag2-pp.in &&
dos.x     -i Ti2Ag2-dos.in &&
average.x -i Ti2Ag2-wf.ave.in > Ti2Ag2-wf.ave.out &&
mv avg.dat Ti2Ag2-avg.dat &&
sleep 10

projwfc.x -i Ti2Ag2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ag.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Ag2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Au2-pp.in &&
dos.x     -i Ti2Au2-dos.in &&
average.x -i Ti2Au2-wf.ave.in > Ti2Au2-wf.ave.out &&
mv avg.dat Ti2Au2-avg.dat &&
sleep 10

projwfc.x -i Ti2Au2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Cd2-pp.in &&
dos.x     -i Ti2Cd2-dos.in &&
average.x -i Ti2Cd2-wf.ave.in > Ti2Cd2-wf.ave.out &&
mv avg.dat Ti2Cd2-avg.dat &&
sleep 10

projwfc.x -i Ti2Cd2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Cd.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Cd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Cr2-pp.in &&
dos.x     -i Ti2Cr2-dos.in &&
average.x -i Ti2Cr2-wf.ave.in > Ti2Cr2-wf.ave.out &&
mv avg.dat Ti2Cr2-avg.dat &&
sleep 10

projwfc.x -i Ti2Cr2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Cr.pdos.out.pdos_atm#11\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#12\\(Cr\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Cr2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Cu2-pp.in &&
dos.x     -i Ti2Cu2-dos.in &&
average.x -i Ti2Cu2-wf.ave.in > Ti2Cu2-wf.ave.out &&
mv avg.dat Ti2Cu2-avg.dat &&
sleep 10

projwfc.x -i Ti2Cu2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Cu.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Cu2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Hg2-pp.in &&
dos.x     -i Ti2Hg2-dos.in &&
average.x -i Ti2Hg2-wf.ave.in > Ti2Hg2-wf.ave.out &&
mv avg.dat Ti2Hg2-avg.dat &&
sleep 10

projwfc.x -i Ti2Hg2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Mo2-pp.in &&
dos.x     -i Ti2Mo2-dos.in &&
average.x -i Ti2Mo2-wf.ave.in > Ti2Mo2-wf.ave.out &&
mv avg.dat Ti2Mo2-avg.dat &&
sleep 10

projwfc.x -i Ti2Mo2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Mo.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Mo2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Nb2-pp.in &&
dos.x     -i Ti2Nb2-dos.in &&
average.x -i Ti2Nb2-wf.ave.in > Ti2Nb2-wf.ave.out &&
mv avg.dat Ti2Nb2-avg.dat &&
sleep 10

projwfc.x -i Ti2Nb2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Nb.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Nb2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Os2-pp.in &&
dos.x     -i Ti2Os2-dos.in &&
average.x -i Ti2Os2-wf.ave.in > Ti2Os2-wf.ave.out &&
mv avg.dat Ti2Os2-avg.dat &&
sleep 10

projwfc.x -i Ti2Os2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Pt2-pp.in &&
dos.x     -i Ti2Pt2-dos.in &&
average.x -i Ti2Pt2-wf.ave.in > Ti2Pt2-wf.ave.out &&
mv avg.dat Ti2Pt2-avg.dat &&
sleep 10

projwfc.x -i Ti2Pt2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Re2-pp.in &&
dos.x     -i Ti2Re2-dos.in &&
average.x -i Ti2Re2-wf.ave.in > Ti2Re2-wf.ave.out &&
mv avg.dat Ti2Re2-avg.dat &&
sleep 10

projwfc.x -i Ti2Re2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Rh2-pp.in &&
dos.x     -i Ti2Rh2-dos.in &&
average.x -i Ti2Rh2-wf.ave.in > Ti2Rh2-wf.ave.out &&
mv avg.dat Ti2Rh2-avg.dat &&
sleep 10

projwfc.x -i Ti2Rh2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Rh.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Rh2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Ru2-pp.in &&
dos.x     -i Ti2Ru2-dos.in &&
average.x -i Ti2Ru2-wf.ave.in > Ti2Ru2-wf.ave.out &&
mv avg.dat Ti2Ru2-avg.dat &&
sleep 10

projwfc.x -i Ti2Ru2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ru.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Ru2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Y2-pp.in &&
dos.x     -i Ti2Y2-dos.in &&
average.x -i Ti2Y2-wf.ave.in > Ti2Y2-wf.ave.out &&
mv avg.dat Ti2Y2-avg.dat &&
sleep 10

projwfc.x -i Ti2Y2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Zn2-pp.in &&
dos.x     -i Ti2Zn2-dos.in &&
average.x -i Ti2Zn2-wf.ave.in > Ti2Zn2-wf.ave.out &&
mv avg.dat Ti2Zn2-avg.dat &&
sleep 10

projwfc.x -i Ti2Zn2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Zn.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Zn2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Zr2-pp.in &&
dos.x     -i Ti2Zr2-dos.in &&
average.x -i Ti2Zr2-wf.ave.in > Ti2Zr2-wf.ave.out &&
mv avg.dat Ti2Zr2-avg.dat &&
sleep 10

projwfc.x -i Ti2Zr2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Zr.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Zr2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Y2Pt2-pp.in &&
dos.x     -i Y2Pt2-dos.in &&
average.x -i Y2Pt2-wf.ave.in > Y2Pt2-wf.ave.out &&
mv avg.dat Y2Pt2-avg.dat &&
sleep 10

projwfc.x -i Y2Pt2-pdos.in &&
sleep 5

STR = "Y.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Y2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Y2Re2-pp.in &&
dos.x     -i Y2Re2-dos.in &&
average.x -i Y2Re2-wf.ave.in > Y2Re2-wf.ave.out &&
mv avg.dat Y2Re2-avg.dat &&
sleep 10

projwfc.x -i Y2Re2-pdos.in &&
sleep 5

STR = "Y.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Y2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Pt2-pp.in &&
dos.x     -i Zn2Pt2-dos.in &&
average.x -i Zn2Pt2-wf.ave.in > Zn2Pt2-wf.ave.out &&
mv avg.dat Zn2Pt2-avg.dat &&
sleep 10

projwfc.x -i Zn2Pt2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Re2-pp.in &&
dos.x     -i Zn2Re2-dos.in &&
average.x -i Zn2Re2-wf.ave.in > Zn2Re2-wf.ave.out &&
mv avg.dat Zn2Re2-avg.dat &&
sleep 10

projwfc.x -i Zn2Re2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Pt2-pp.in &&
dos.x     -i Zr2Pt2-dos.in &&
average.x -i Zr2Pt2-wf.ave.in > Zr2Pt2-wf.ave.out &&
mv avg.dat Zr2Pt2-avg.dat &&
sleep 10

projwfc.x -i Zr2Pt2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Re2-pp.in &&
dos.x     -i Zr2Re2-dos.in &&
average.x -i Zr2Re2-wf.ave.in > Zr2Re2-wf.ave.out &&
mv avg.dat Zr2Re2-avg.dat &&
sleep 10

projwfc.x -i Zr2Re2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Re2_top_layer_\(d\).dat`"
echo $STR

