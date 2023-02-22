#!/bin/bash
#SBATCH --partition=largemem
#SBATCH --cpus-per-task=32
#SBATCH --mem=512g
#SBATCH --ntasks-per-core=1
#SBATCH --time=96:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=javan.okendo@nih.gov
#SBATCH --job-name=verkkoNoTrio

#move to the working directory
cd /data/okendojo/slugProject/assembly/verkko/

#Load the modules
module load verkko/1.2
module load python/3.9
module load snakemake/7.7.0
module load R/4.2.0
module load bedtools/2.30.0
module load samtools/1.9
#mkdir noTrioVerkko
#Run verkko

verkko -d notrio --hifi /data/okendojo/slugProject/hifi/derLae_hifi.fq.gz --no-nano --slurm --graphaligner --mbg
