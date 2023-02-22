#!/bin/bash
#SBATCH --partition=norm
#SBATCH --cpus-per-task=32
#SBATCH --mem=232g
#SBATCH --ntasks-per-core=1
#SBATCH --time=170:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=javan.okendo@nih.gov
#SBATCH --job-name=Blastslug

#Load the required modules
module load blast

#======================
###paradisefish genome annotation##
#=====================
#1. Run functional annotation

cd /data/okendojo/paradisfishProject/annotation/zebrafish/blatAnalysis

#prepare the uniprot database
#makeblastdb -in uniprot-8zebrafis.fasta -dbtype prot 

query=/data/okendojo/paradisfishProject/annotation/zebrafish/blatAnalysis/maker2_blat.all.maker.proteins.fasta

db=/data/okendojo/slugProject/proteinDB/uniprot_invertebrate.fasta


blastp -query ${query} -db ${db} -evalue 1e-6 -max_hsps 1 -max_target_seqs 1 -num_threads 32 -outfmt 6 -out blastp.out
