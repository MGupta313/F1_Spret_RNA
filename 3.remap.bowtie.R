# Read in bistools; sources many important functions for this script
source("/home/Apps/bitbucket/bistools/ESB_bisTools.R") # Magic
library("stringr") # str_split_1()

projectDir = "/home/mgupta/Carly_F1/RNA/" # Replace, must have '/' at the end

# Set working directory
homeDir = paste0(projectDir, "pipeline/")
setwd(homeDir)

# Manifest file
filesDir = homeDir # Replace, if necessary
filesFile = "RNAseq.sample.manifest.txt" # Replace, if necessary
files = read.table(paste0(filesDir, filesFile), sep = "\t", header = T, as.is = T)

intersecting_dir = paste0(homeDir,"find_intersecting_snps/")
outputDir = paste0(homeDir, "remap_output/")

for (i in 4:nrow(files)) {
  
  if (!files$include[i]) { next }
  
  time_start = Sys.time()
  print(paste(files$sample[i], time_start))
  
  print("Bowtie mapping and sam to bam")
  fqMate1 = paste0(files$sample[i],".sort.rg.dupMark.remap.fq1.gz")
  fqMate2 = paste0(files$sample[i],".sort.rg.dupMark.remap.fq2.gz")
  bowtieOutput = paste0(outputDir, files$sample[i], ".remap.bam")
  
  bowtieCall = paste("bowtie2 -x /home/Apps/genomes/bowtie2/mm39/mm39 -1", paste0(intersecting_dir, fqMate1), "-2", paste0(intersecting_dir,fqMate2), "-p 32 | samtools view -b -q 10 - >", bowtieOutput)
  system(bowtieCall)
  
  sortCmd = paste("samtools sort -o", paste0(outputDir, files$sample[i], ".remap.sort.bam"),bowtieOutput)
  system(sortCmd)
  
  indexCmd = paste("samtools index", paste0(outputDir, files$sample[i], ".remap.sort.bam"))
system(indexCmd)
}
