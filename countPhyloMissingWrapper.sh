#Usage:
#./countPhyloMissingWrapper.sh filepath
#./countPhyloMissingWrapper.sh ./output/*.nex
#Used for: counting and viewing the amount of phylogenetic data in a nexus formatted file
#Dependencies: Anaconda Python (for Pandas)


for file in "$@"; 
do ./countPhyloMissing.sh $file; 
name=`basename $file` 

paste -d, pops.txt intermed_count > $name
python plotPhyloMissing.py $name
done

