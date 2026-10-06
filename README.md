# WASP Allelic Bias Wokflow #

This directory contains scripts that can be used to eliminate mapping bias from mapped allele-specific reads. 
First, reads are mapped normally using bowtie2. Then mapped reads that overlap single nucleotide polymorphisms (SNPs) are identified. 
For each read that overlaps a SNP, its genotype is swapped with that of the other allele and the read is re-mapped. 
Re-mapped reads that fail to map to exactly the same location in the genome are discarded.

### System requirements ###

1. Mapping
	1. skewer
	2. fastqc
	3. bowtie2
	4. samtools
	5. picard MarkDuplicates
2. WASP
	1. python 3.x. 
	2. numpy
	3. pysam version 0.8.4 or higher
	4. scipy
	5. PyTables version 3.x. 
NOTE: Use chraccr_env on ESB for these dependencies

### Pre-requisite files ###

1. Reference Genome files:
	1. mm39.fa
	2. bowtie2 index
	NOTE: Refer to /home/Apps/genomes/bowtie2. 
2. Variant files:
	1. SPRET_B6.raw.vcf.gz - contains spret and b6 allelic information with chr prefix. 
	2. Per chromosome vcf file. 
	NOTE: Refer to /home/Apps/genomes/spret/README

### Workflow ###

1. Download the required input files like genome and variant files.
2. Create the per chromosome split file and indices as mentioned ablve.
3. Run standard mapping using bowtie2 - 1.RNAseq.map.R
4. Find overlapping reads at snp positions - 2.find_intersecting_snps.sh
5. Re-map using bowtie2 - 3.remap.bowtie.R
6. Filter out reads where reads fail to map back to the same location - 4.filter_remapped_reads.py
7. Merge keep.bam and remap.keep.bam files - 5.mergeBam.sh
8. Filter out duplicate reads - 6.removeDups.sh

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact
