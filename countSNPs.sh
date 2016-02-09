#Usage:
#./countSNPs.sh filepath
#./countSNPs.sh ./output/*.snps.tsv
#Used for: counting and viewing SNPs identified by sstacks
#Dependencies: Anaconda Python (for Pandas)


for file in "$@"; 
do 
wc -l $file >> SNPS;
echo `basename $file` >> names; 
done

cut -d'.'  -f1 SNPS > sites
paste -d, sites names > putativeSNPs 

python plotPutativeSNPS.py


#rm names
#rm SNPS