# Set these environment vars to point to
# your local installation of WASP
WASP=/home/Apps/WASP
DATA_DIR=//home/mgupta/Carly_F1/RNA/data

for SAMPLE_NAME in SCR001 SCR002 SCR003 SCR004 SCR005 SCR006 SCR007 SCR008 SCR009 SCR010 SCR011 SCR012 SCR013 SCR014 SCR015 SCR016 SCR017 SCR018 SCR019 SCR020 SCR021 SCR022 SCR023 SCR024 SCR025 SCR026 SCR027 SCR028 SCR029 SCR030 SCR031 SCR032 SCR033 SCR034 SCR035 SCR036 SCR037 SCR038 SCR039 SCR040 SCR041 SCR042 SCR043 SCR044 SCR045 SCR046
do
   python $WASP/mapping/find_intersecting_snps.py \
       --is_paired_end \
       --is_sorted \
       --output_dir find_intersecting_snps \
       --snp_dir output_snp_dir \
       $DATA_DIR/${SAMPLE_NAME}/${SAMPLE_NAME}.sort.rg.dupMark.bam
done

