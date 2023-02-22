#!/bin/bash
#SBATCH --partition=norm
#SBATCH --cpus-per-task=32
#SBATCH --mem=200g
#SBATCH --ntasks-per-core=1
#SBATCH --time=96:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=javan.okendo@nih.gov
#SBATCH --job-name=verkkoTrio
#move to the working directory

cd /data/okendojo/slugProject/assembly/verkko

module load verkko/1.1
module load python/3.9
module load snakemake/7.7.0
module load R/4.2.0
module load bedtools/2.30.0
module load samtools/1.9

#meryl db paths

pat=/data/okendojo/slugProject/meryldb/pat_compressed.k21.hapmer.meryl
mat=/data/okendojo/slugProject/meryldb/mat_compress.k21.hapmer.meryl 

#Run verkko
verkko -d trio --hifi /data/okendojo/slugProject/hifi/derLae_hifi.fq.gz  --no-nano  --slurm --hap-kmers ${mat} ${pat}  trio
