#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=ECUT-500##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022Apr05files.1.out     ##CHANGE
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
module load qe/6.6_openmpi-4.0.3

ulimit -s unlimited

export OMP_NUM_THREADS=1

##cd to working directory
mpirun -np 37 pw.x -i Ag-500.in > Ag-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Au-500.in > Au-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cd-500.in > Cd-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cr-500.in > Cr-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cu-500.in > Cu-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hf-500.in > Hf-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hg-500.in > Hg-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ir-500.in > Ir-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i La-500.in > La-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mo-500.in > Mo-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Nb-500.in > Nb-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Os-500.in > Os-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pd-500.in > Pd-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pt-500.in > Pt-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Re-500.in > Re-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Rh-500.in > Rh-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ru-500.in > Ru-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Sc-500.in > Sc-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ta-500.in > Ta-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Tc-500.in > Tc-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ti-500.in > Ti-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i V-500.in > V-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i W-500.in > W-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Y-500.in > Y-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zn-500.in > Zn-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zr-500.in > Zr-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Co-500.in > Co-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mn-500.in > Mn-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Fe-500.in > Fe-500.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ni-500.in > Ni-500.out   ##   mpirun -np XX pw.x -i input_file > output_file
