DATA_DIR=/home/mgupta/Carly_F1/RNA/pipeline
mkdir /home/mgupta/Carly_F1/RNA/pipeline/merge
mkdir /home/mgupta/Carly_F1/RNA/pipeline/dupFilter

for SAMPLE_NAME in SCR001 SCR002 SCR003 SCR004 SCR005 SCR006 SCR007 SCR008 SCR009 SCR010 SCR011 SCR012 SCR013 SCR014 SCR015 SCR016 SCR017 SCR018 SCR019 SCR020 SCR021 SCR022 SCR023 SCR024 SCR025 SCR026 SCR027 SCR028 SCR029 SCR030 SCR031 SCR032 SCR033 SCR034 SCR035 SCR036 SCR037 SCR038 SCR039 SCR040 SCR041 SCR042 SCR043 SCR044 SCR045 SCR046
do
   # Merging Step
   samtools merge $DATA_DIR/merge/${SAMPLE_NAME}.keep.merge.bam \
     $DATA_DIR/filter_remapped_reads/${SAMPLE_NAME}.keep.bam  \
     $DATA_DIR/find_intersecting_snps/${SAMPLE_NAME}.sort.rg.dupMark.keep.bam
    
   samtools sort -o  $DATA_DIR/merge/${SAMPLE_NAME}.keep.merge.sort.bam \
     $DATA_DIR/merge/${SAMPLE_NAME}.keep.merge.bam 
    
   samtools index $DATA_DIR/merge/${SAMPLE_NAME}.keep.merge.sort.bam

done
