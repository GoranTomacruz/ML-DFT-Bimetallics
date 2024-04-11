#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=ECUT-600##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022Apr05files.3.out     ##CHANGE
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
mpirun -np 37 pw.x -i Ag-600.in > Ag-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Au-600.in > Au-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cd-600.in > Cd-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cr-600.in > Cr-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cu-600.in > Cu-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hf-600.in > Hf-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hg-600.in > Hg-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ir-600.in > Ir-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i La-600.in > La-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mo-600.in > Mo-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Nb-600.in > Nb-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Os-600.in > Os-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pd-600.in > Pd-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pt-600.in > Pt-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Re-600.in > Re-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Rh-600.in > Rh-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ru-600.in > Ru-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Sc-600.in > Sc-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ta-600.in > Ta-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Tc-600.in > Tc-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ti-600.in > Ti-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i V-600.in > V-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i W-600.in > W-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Y-600.in > Y-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zn-600.in > Zn-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zr-600.in > Zr-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Co-600.in > Co-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mn-600.in > Mn-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Fe-600.in > Fe-600.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ni-600.in > Ni-600.out   ##   mpirun -np XX pw.x -i input_file > output_file
