#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-09##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.09.out     ##CHANGE
#SBATCH --error=2022July14files.09.err     ##CHANGE
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
sleep 10

STR="Ni2Ag2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Ag2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Ag2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ag2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ag2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2Ag2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Au2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Au2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Au2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Au2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Au2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Au2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Au2_top-B_\(d\).dat`"
echo $STR

STR="Ni2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Au2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Cd2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cd2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Cd2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Cd2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cd2_top-B_\(d\).dat`"
echo $STR

STR="Ni2Cd2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Cu2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cu2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Cu2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cu2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Cu2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cu2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Cu2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cu2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Cu2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cu2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Hf2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Hf2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Hf2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Ni2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2Hf2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Hf2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Hg2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hg2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Hg2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hg2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hg2_top-A_\(d\).dat`"
echo $STR

STR="Ni2Hg2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hg2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Ir2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Ir2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Ir2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Ir2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2Ir2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Ir2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ir2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Ni2Ir2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ir2_bridge-A_B-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2La2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2La2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Ni2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2La2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2La2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2La2_top-B_\(d\).dat`"
echo $STR

STR="Ni2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Ni2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2La2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2La2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2La2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2La2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Ni2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2La2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2La2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Ni2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2La2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Mo2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Mo2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Mo2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Mo2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Mo2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Mo2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Mo2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Mo2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Mo2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Mo2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Nb2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Nb2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Nb2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Nb2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Nb2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Nb2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Nb2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Nb2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Nb2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Nb2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Os2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Os2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Os2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Os2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Os2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Os2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Os2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Os2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Os2_top-A_\(d\).dat`"
echo $STR

STR="Ni2Os2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Os2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Os2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Os2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Os2_bridge-A_B-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Pd2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pd2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2Pd2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pd2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Pd2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pd2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Pd2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Pt2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pt2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Pt2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pt2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Pt2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pt2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Pt2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pt2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Re2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Re2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Re2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Re2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Re2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Re2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Re2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Re2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Re2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Re2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Rh2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Rh2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Rh2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Rh2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Rh2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Rh2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Rh2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Rh2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Ru2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Ru2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Ru2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Ru2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Ru2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ru2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Ta2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Ta2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Ta2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Ta2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2W2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2W2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2W2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2W2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2W2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ni2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2W2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2W2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ni2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2W2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2W2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2W2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Y2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Y2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2Y2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Y2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Y2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Y2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Y2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Zr2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zr2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2Zr2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zr2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Zr2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zr2_top-A_\(d\).dat`"
echo $STR

STR="Ni2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zr2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ni2Zr2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zr2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Zr2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zr2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

