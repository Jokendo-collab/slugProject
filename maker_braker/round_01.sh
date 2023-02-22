#!/bin/bash
#SBATCH --partition=norm
#SBATCH --cpus-per-task=32
#SBATCH --mem=232g
#SBATCH --ntasks-per-core=1
#SBATCH --time=240:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=javan.okendo@nih.gov
#SBATCH --job-name=01_makerSlug

#Load the required modules
module load maker
module load augustus
module load busco
module load blast
module load genometools
module load seqkit
module load bioawk

#======================
###paradisefish genome annotation##
#=====================
#1. Run maker annotation

cd /data/okendojo/slugProject/annot

OPS="/home/okendojo/scripts/slugFish/maker_braker/ops/maker1_opts.ctl"
BOPTS="/home/okendojo/scripts/slugFish/maker_braker/ops/maker_bopts.ctl"
EXEC="/home/okendojo/scripts/slugFish/maker_braker/ops/maker_exe.ctl"

mpiexec -n 32 maker -base maker_01 ${OPS} ${BOPTS} ${EXEC}  
