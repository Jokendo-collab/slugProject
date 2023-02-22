#!/bin/bash
#SBATCH --partition=norm
#SBATCH --cpus-per-task=32
#SBATCH --mem=80g
#SBATCH --ntasks-per-core=1
#SBATCH --time=170:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=javan.okendo@nih.gov

#Load the required modules
module load trimgalore
module load multiqc


cd /data/okendojo/zebrafish/data/G3/AB_F_CB

mkdir qc_results

# Run Trim Galore! 

for fastq in *.fastq.gz

do 

trim_galore --quality 20 --fastqc --length 25 --output_dir qc_results $fastq

done


