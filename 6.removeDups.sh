DATA_DIR=/home/mgupta/Carly_F1/RNA/pipeline
mkdir /home/mgupta/Carly_F1/RNA/pipeline/dupFilter

for SAMPLE_NAME in SCR001 SCR002 SCR003 SCR004 SCR005 SCR006 SCR007 SCR008 SCR009 SCR010 SCR011 SCR012 SCR013 SCR014 SCR015 SCR016 SCR017 SCR018 SCR019 SCR020 SCR021 SCR022 SCR023 SCR024 SCR025 SCR026 SCR027 SCR028 SCR029 SCR030 SCR031 SCR032 SCR033 SCR034 SCR035 SCR036 SCR037 SCR038 SCR039 SCR040 SCR041 SCR042 SCR043 SCR044 SCR045 SCR046
do
   # Duplicate filtering step
   python /home/Apps/WASP/mapping/rmdup_pe.py $DATA_DIR/merge/${SAMPLE_NAME}.keep.merge.sort.bam $DATA_DIR/dupFilter/${SAMPLE_NAME}.keep.merge.sort.dupFilter.bam

   # sorting and indexing - final step
   samtools sort -o $DATA_DIR/dupFilter/${SAMPLE_NAME}.keep.merge.sorted.dupFilter.bam $DATA_DIR/dupFilter/${SAMPLE_NAME}.keep.merge.sort.dupFilter.bam
   samtools index $DATA_DIR/dupFilter/${SAMPLE_NAME}.keep.merge.sorted.dupFilter.bam
done
