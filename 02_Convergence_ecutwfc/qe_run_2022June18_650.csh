#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=ECUT-650##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June18files.4.out     ##CHANGE
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
mpirun -np 37 pw.x -i Ag-650.in > Ag-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Au-650.in > Au-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cd-650.in > Cd-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cr-650.in > Cr-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cu-650.in > Cu-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hf-650.in > Hf-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hg-650.in > Hg-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ir-650.in > Ir-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i La-650.in > La-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mo-650.in > Mo-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Nb-650.in > Nb-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Os-650.in > Os-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pd-650.in > Pd-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pt-650.in > Pt-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Re-650.in > Re-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Rh-650.in > Rh-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ru-650.in > Ru-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Sc-650.in > Sc-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ta-650.in > Ta-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Tc-650.in > Tc-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ti-650.in > Ti-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i V-650.in > V-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i W-650.in > W-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Y-650.in > Y-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zn-650.in > Zn-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zr-650.in > Zr-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Co-650.in > Co-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mn-650.in > Mn-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Fe-650.in > Fe-650.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ni-650.in > Ni-650.out   ##   mpirun -np XX pw.x -i input_file > output_file
