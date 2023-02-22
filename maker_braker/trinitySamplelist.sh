#!/bin/bash
#SBATCH --partition=largemem
#SBATCH --cpus-per-task=32
#SBATCH --mem=512g
#SBATCH --ntasks-per-core=1
#SBATCH --time=240:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=javan.okendo@nih.gov

cd /data/okendojo/slugProject/rnaseq

# Load the module
module load trinity/2.14.0

mkdir trinityasm

Trinity --seqType fq --max_memory 512G  --samples_file sample.txt --trimmomatic  --monitoring --monitor_sec 30 --CPU 32 --output trinityasm


