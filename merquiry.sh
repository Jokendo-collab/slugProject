#!/bin/bash
#SBATCH --partition=norm
#SBATCH --cpus-per-task=32
#SBATCH --mem=80g
#SBATCH --ntasks-per-core=1
#SBATCH --time=96:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=javan.okendo@nih.gov
#move to the working directory

#Load the modules
module load python/3.9
module load snakemake/7.7.0
module load R/4.2.0
module load bedtools/2.30.0
module load samtools/1.9

cd /data/okendojo/slugProject/uncompressedHapmers

assembly=/data/okendojo/slugProject/assembly/verkko/notrio/assembly.fasta

$tools/merqury/merqury.sh child.meryl maternal.hapmer.meryl paternal.hapmer.meryl ${assembly}  verkkoPasm 
