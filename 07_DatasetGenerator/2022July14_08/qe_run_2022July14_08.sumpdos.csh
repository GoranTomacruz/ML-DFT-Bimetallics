#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-08##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.08.out     ##CHANGE
#SBATCH --error=2022July14files.08.err     ##CHANGE
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
STR="Cr2La2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2La2_top-A_\(d\).dat`"
echo $STR

STR="Cr2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2La2_top-B_\(d\).dat`"
echo $STR

STR="Cr2La2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2La2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2La2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cr2La2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2La2_top-A_\(d\).dat`"
echo $STR

STR="Cr2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Cr2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2La2_top-B_\(d\).dat`"
echo $STR

STR="Cu2La2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2La2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2La2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cu2La2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Cu2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2La2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2La2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2La2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Cu2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2La2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Cu2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Cu2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2La2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Cu2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2La2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="La2Ag2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ag2_top-B_\(d\).dat`"
echo $STR

STR="La2Ag2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ag2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="La2Ag2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ag2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) La2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ag2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="La2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ag2_top-A_\(d\).dat`"
echo $STR

STR="La2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) La2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ag2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Ag2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ag2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="La2Au2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Au2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Au2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="La2Au2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Au2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) La2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Au2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="La2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) La2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Au2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Au2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Au2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Au2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Au2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="La2Cd2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Cd2_top-B_\(d\).dat`"
echo $STR

STR="La2Cd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Cd2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Cd2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="La2Cd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Cd2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) La2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Cd2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="La2Cd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Cd2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Cd2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="La2Hf2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) La2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="La2Hf2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="La2Hf2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="La2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) La2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Hf2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) La2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Hf2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) La2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="La2Hf2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="La2Hf2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="La2Hg2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hg2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hg2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Hg2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hg2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hg2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="La2Hg2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hg2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) La2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hg2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="La2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) La2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Ir2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ir2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="La2Ir2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ir2_top-B_\(d\).dat`"
echo $STR

STR="La2Ir2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ir2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Ir2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ir2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="La2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) La2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Mo2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Mo2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Mo2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Mo2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="La2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) La2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Mo2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="La2Mo2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Mo2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Mo2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) La2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Mo2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Mo2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Mo2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Mo2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="La2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) La2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_top-B_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) La2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#9\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_top-A_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) La2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) La2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) La2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="La2Nb2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="La2Os2.pdos.out.pdos_atm#9\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Os2_top-A_\(d\).dat`"
echo $STR

STR="La2Os2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Os2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Os2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Os2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Os2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Os2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="La2Pd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pd2_top-A_\(d\).dat`"
echo $STR

STR="La2Pd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Pd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) La2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pd2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="La2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pd2_top-B_\(d\).dat`"
echo $STR

STR="La2Pd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pd2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) La2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pd2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Pd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) La2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pd2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="La2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) La2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pt2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Pt2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Pt2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pt2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Pt2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Pt2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pt2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Pt2.pdos.out.pdos_atm#9\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pt2_top-A_\(d\).dat`"
echo $STR

STR="La2Pt2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Pt2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pt2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="La2Re2.pdos.out.pdos_atm#9\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Re2_top-A_\(d\).dat`"
echo $STR

STR="La2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Re2_top-B_\(d\).dat`"
echo $STR

STR="La2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Re2_top-B_\(d\).dat`"
echo $STR

STR="La2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) La2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Re2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="La2Rh2.pdos.out.pdos_atm#9\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Rh2_top-A_\(d\).dat`"
echo $STR

STR="La2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Rh2_top-B_\(d\).dat`"
echo $STR

STR="La2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) La2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Rh2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Rh2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) La2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Rh2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="La2Rh2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Rh2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Rh2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Rh2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Rh2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Rh2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="La2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) La2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ru2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Ru2.pdos.out.pdos_atm#9\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ru2_top-A_\(d\).dat`"
echo $STR

STR="La2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ru2_top-B_\(d\).dat`"
echo $STR

STR="La2Ru2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ru2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ru2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Ru2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ru2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Ru2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ru2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="La2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) La2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="La2Ta2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Ta2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) La2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="La2Ta2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="La2Ta2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) La2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Ta2.pdos.out.pdos_atm#9\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_top-A_\(d\).dat`"
echo $STR

STR="La2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) La2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Ta2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="La2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) La2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Tc2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Tc2_top-B_\(d\).dat`"
echo $STR

STR="La2Tc2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Tc2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2Tc2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Tc2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="La2Tc2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Tc2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Tc2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Tc2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="La2W2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2W2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2W2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2W2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="La2W2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2W2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="La2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) La2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2W2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) La2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2W2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="La2W2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) La2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2W2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="La2Y2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Y2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="La2Y2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Y2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Y2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) La2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Y2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="La2Y2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) La2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="La2Y2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#10\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Y2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="La2Zr2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Zr2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="La2Zr2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Zr2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="La2Zr2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) La2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Zr2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="La2Zr2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) La2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Zr2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="La2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) La2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Zr2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Sc2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2La2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Sc2La2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Sc2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2La2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2La2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Sc2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2La2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2La2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2La2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2La2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2La2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2La2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2La2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ti2La2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Ti2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2La2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2La2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2La2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ti2La2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2La2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Ti2La2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Ti2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2La2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="V2La2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2La2.pdos.out.pdos_atm#10\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="V2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) V2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2La2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Zn2La2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2La2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2La2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

