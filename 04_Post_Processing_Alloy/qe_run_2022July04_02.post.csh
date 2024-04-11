./2022July04_02/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-02##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.02.out     ##CHANGE
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
pp.x      -i Ag2Ir2-pp.in &&
dos.x     -i Ag2Ir2-dos.in &&
average.x -i Ag2Ir2-wf.ave.in > Ag2Ir2-wf.ave.out &&
mv avg.dat Ag2Ir2-avg.dat &&
sleep 10

projwfc.x -i Ag2Ir2-pdos.in &&
sleep 5

STR = "Ag.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ag2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cd2Ir2-pp.in &&
dos.x     -i Cd2Ir2-dos.in &&
average.x -i Cd2Ir2-wf.ave.in > Cd2Ir2-wf.ave.out &&
mv avg.dat Cd2Ir2-avg.dat &&
sleep 10

projwfc.x -i Cd2Ir2-pdos.in &&
sleep 5

STR = "Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cd2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Ir2-pp.in &&
dos.x     -i Cr2Ir2-dos.in &&
average.x -i Cr2Ir2-wf.ave.in > Cr2Ir2-wf.ave.out &&
mv avg.dat Cr2Ir2-avg.dat &&
sleep 10

projwfc.x -i Cr2Ir2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Tc2-pp.in &&
dos.x     -i Cr2Tc2-dos.in &&
average.x -i Cr2Tc2-wf.ave.in > Cr2Tc2-wf.ave.out &&
mv avg.dat Cr2Tc2-avg.dat &&
sleep 10

projwfc.x -i Cr2Tc2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Tc2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cu2Ir2-pp.in &&
dos.x     -i Cu2Ir2-dos.in &&
average.x -i Cu2Ir2-wf.ave.in > Cu2Ir2-wf.ave.out &&
mv avg.dat Cu2Ir2-avg.dat &&
sleep 10

projwfc.x -i Cu2Ir2-pdos.in &&
sleep 5

STR = "Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cu2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cu2Tc2-pp.in &&
dos.x     -i Cu2Tc2-dos.in &&
average.x -i Cu2Tc2-wf.ave.in > Cu2Tc2-wf.ave.out &&
mv avg.dat Cu2Tc2-avg.dat &&
sleep 10

projwfc.x -i Cu2Tc2-pdos.in &&
sleep 5

STR = "Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cu2Tc2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ir2Au2-pp.in &&
dos.x     -i Ir2Au2-dos.in &&
average.x -i Ir2Au2-wf.ave.in > Ir2Au2-wf.ave.out &&
mv avg.dat Ir2Au2-avg.dat &&
sleep 10

projwfc.x -i Ir2Au2-pdos.in &&
sleep 5

STR = "Ir.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ir2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ir2Hg2-pp.in &&
dos.x     -i Ir2Hg2-dos.in &&
average.x -i Ir2Hg2-wf.ave.in > Ir2Hg2-wf.ave.out &&
mv avg.dat Ir2Hg2-avg.dat &&
sleep 10

projwfc.x -i Ir2Hg2-pdos.in &&
sleep 5

STR = "Ir.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ir2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ir2Pt2-pp.in &&
dos.x     -i Ir2Pt2-dos.in &&
average.x -i Ir2Pt2-wf.ave.in > Ir2Pt2-wf.ave.out &&
mv avg.dat Ir2Pt2-avg.dat &&
sleep 10

projwfc.x -i Ir2Pt2-pdos.in &&
sleep 5

STR = "Ir.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ir2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Ir2-pp.in &&
dos.x     -i Mo2Ir2-dos.in &&
average.x -i Mo2Ir2-wf.ave.in > Mo2Ir2-wf.ave.out &&
mv avg.dat Mo2Ir2-avg.dat &&
sleep 10

projwfc.x -i Mo2Ir2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Tc2-pp.in &&
dos.x     -i Mo2Tc2-dos.in &&
average.x -i Mo2Tc2-wf.ave.in > Mo2Tc2-wf.ave.out &&
mv avg.dat Mo2Tc2-avg.dat &&
sleep 10

projwfc.x -i Mo2Tc2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Tc2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Ir2-pp.in &&
dos.x     -i Nb2Ir2-dos.in &&
average.x -i Nb2Ir2-wf.ave.in > Nb2Ir2-wf.ave.out &&
mv avg.dat Nb2Ir2-avg.dat &&
sleep 10

projwfc.x -i Nb2Ir2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Tc2-pp.in &&
dos.x     -i Nb2Tc2-dos.in &&
average.x -i Nb2Tc2-wf.ave.in > Nb2Tc2-wf.ave.out &&
mv avg.dat Nb2Tc2-avg.dat &&
sleep 10

projwfc.x -i Nb2Tc2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Tc2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Os2Ir2-pp.in &&
dos.x     -i Os2Ir2-dos.in &&
average.x -i Os2Ir2-wf.ave.in > Os2Ir2-wf.ave.out &&
mv avg.dat Os2Ir2-avg.dat &&
sleep 10

projwfc.x -i Os2Ir2-pdos.in &&
sleep 5

STR = "Os.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Os2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Re2Ir2-pp.in &&
dos.x     -i Re2Ir2-dos.in &&
average.x -i Re2Ir2-wf.ave.in > Re2Ir2-wf.ave.out &&
mv avg.dat Re2Ir2-avg.dat &&
sleep 10

projwfc.x -i Re2Ir2-pdos.in &&
sleep 5

STR = "Re.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Re2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2Ir2-pp.in &&
dos.x     -i Rh2Ir2-dos.in &&
average.x -i Rh2Ir2-wf.ave.in > Rh2Ir2-wf.ave.out &&
mv avg.dat Rh2Ir2-avg.dat &&
sleep 10

projwfc.x -i Rh2Ir2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ru2Ir2-pp.in &&
dos.x     -i Ru2Ir2-dos.in &&
average.x -i Ru2Ir2-wf.ave.in > Ru2Ir2-wf.ave.out &&
mv avg.dat Ru2Ir2-avg.dat &&
sleep 10

projwfc.x -i Ru2Ir2-pdos.in &&
sleep 5

STR = "Ru.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ru2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Ir2-pp.in &&
dos.x     -i Sc2Ir2-dos.in &&
average.x -i Sc2Ir2-wf.ave.in > Sc2Ir2-wf.ave.out &&
mv avg.dat Sc2Ir2-avg.dat &&
sleep 10

projwfc.x -i Sc2Ir2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Tc2-pp.in &&
dos.x     -i Sc2Tc2-dos.in &&
average.x -i Sc2Tc2-wf.ave.in > Sc2Tc2-wf.ave.out &&
mv avg.dat Sc2Tc2-avg.dat &&
sleep 10

projwfc.x -i Sc2Tc2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Tc2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Ag2-pp.in &&
dos.x     -i Tc2Ag2-dos.in &&
average.x -i Tc2Ag2-wf.ave.in > Tc2Ag2-wf.ave.out &&
mv avg.dat Tc2Ag2-avg.dat &&
sleep 10

projwfc.x -i Tc2Ag2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Ag.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Ag2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Au2-pp.in &&
dos.x     -i Tc2Au2-dos.in &&
average.x -i Tc2Au2-wf.ave.in > Tc2Au2-wf.ave.out &&
mv avg.dat Tc2Au2-avg.dat &&
sleep 10

projwfc.x -i Tc2Au2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Cd2-pp.in &&
dos.x     -i Tc2Cd2-dos.in &&
average.x -i Tc2Cd2-wf.ave.in > Tc2Cd2-wf.ave.out &&
mv avg.dat Tc2Cd2-avg.dat &&
sleep 10

projwfc.x -i Tc2Cd2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Cd.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Cd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Hg2-pp.in &&
dos.x     -i Tc2Hg2-dos.in &&
average.x -i Tc2Hg2-wf.ave.in > Tc2Hg2-wf.ave.out &&
mv avg.dat Tc2Hg2-avg.dat &&
sleep 10

projwfc.x -i Tc2Hg2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Ir2-pp.in &&
dos.x     -i Tc2Ir2-dos.in &&
average.x -i Tc2Ir2-wf.ave.in > Tc2Ir2-wf.ave.out &&
mv avg.dat Tc2Ir2-avg.dat &&
sleep 10

projwfc.x -i Tc2Ir2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Os2-pp.in &&
dos.x     -i Tc2Os2-dos.in &&
average.x -i Tc2Os2-wf.ave.in > Tc2Os2-wf.ave.out &&
mv avg.dat Tc2Os2-avg.dat &&
sleep 10

projwfc.x -i Tc2Os2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Pt2-pp.in &&
dos.x     -i Tc2Pt2-dos.in &&
average.x -i Tc2Pt2-wf.ave.in > Tc2Pt2-wf.ave.out &&
mv avg.dat Tc2Pt2-avg.dat &&
sleep 10

projwfc.x -i Tc2Pt2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Pt2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Re2-pp.in &&
dos.x     -i Tc2Re2-dos.in &&
average.x -i Tc2Re2-wf.ave.in > Tc2Re2-wf.ave.out &&
mv avg.dat Tc2Re2-avg.dat &&
sleep 10

projwfc.x -i Tc2Re2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Re2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Rh2-pp.in &&
dos.x     -i Tc2Rh2-dos.in &&
average.x -i Tc2Rh2-wf.ave.in > Tc2Rh2-wf.ave.out &&
mv avg.dat Tc2Rh2-avg.dat &&
sleep 10

projwfc.x -i Tc2Rh2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Rh.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Rh2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Ru2-pp.in &&
dos.x     -i Tc2Ru2-dos.in &&
average.x -i Tc2Ru2-wf.ave.in > Tc2Ru2-wf.ave.out &&
mv avg.dat Tc2Ru2-avg.dat &&
sleep 10

projwfc.x -i Tc2Ru2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Ru.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Ru2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Tc2Y2-pp.in &&
dos.x     -i Tc2Y2-dos.in &&
average.x -i Tc2Y2-wf.ave.in > Tc2Y2-wf.ave.out &&
mv avg.dat Tc2Y2-avg.dat &&
sleep 10

projwfc.x -i Tc2Y2-pdos.in &&
sleep 5

STR = "Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Tc2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Ir2-pp.in &&
dos.x     -i Ti2Ir2-dos.in &&
average.x -i Ti2Ir2-wf.ave.in > Ti2Ir2-wf.ave.out &&
mv avg.dat Ti2Ir2-avg.dat &&
sleep 10

projwfc.x -i Ti2Ir2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Ti2Tc2-pp.in &&
dos.x     -i Ti2Tc2-dos.in &&
average.x -i Ti2Tc2-wf.ave.in > Ti2Tc2-wf.ave.out &&
mv avg.dat Ti2Tc2-avg.dat &&
sleep 10

projwfc.x -i Ti2Tc2-pdos.in &&
sleep 5

STR = "Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Ti2Tc2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Y2Ir2-pp.in &&
dos.x     -i Y2Ir2-dos.in &&
average.x -i Y2Ir2-wf.ave.in > Y2Ir2-wf.ave.out &&
mv avg.dat Y2Ir2-avg.dat &&
sleep 10

projwfc.x -i Y2Ir2-pdos.in &&
sleep 5

STR = "Y.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Y2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Ir2-pp.in &&
dos.x     -i Zn2Ir2-dos.in &&
average.x -i Zn2Ir2-wf.ave.in > Zn2Ir2-wf.ave.out &&
mv avg.dat Zn2Ir2-avg.dat &&
sleep 10

projwfc.x -i Zn2Ir2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Tc2-pp.in &&
dos.x     -i Zn2Tc2-dos.in &&
average.x -i Zn2Tc2-wf.ave.in > Zn2Tc2-wf.ave.out &&
mv avg.dat Zn2Tc2-avg.dat &&
sleep 10

projwfc.x -i Zn2Tc2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Tc2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Ir2-pp.in &&
dos.x     -i Zr2Ir2-dos.in &&
average.x -i Zr2Ir2-wf.ave.in > Zr2Ir2-wf.ave.out &&
mv avg.dat Zr2Ir2-avg.dat &&
sleep 10

projwfc.x -i Zr2Ir2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Tc2-pp.in &&
dos.x     -i Zr2Tc2-dos.in &&
average.x -i Zr2Tc2-wf.ave.in > Zr2Tc2-wf.ave.out &&
mv avg.dat Zr2Tc2-avg.dat &&
sleep 10

projwfc.x -i Zr2Tc2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Tc2_top_layer_\(d\).dat`"
echo $STR

