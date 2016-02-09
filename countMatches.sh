#Usage:
#./countMatches.sh filepath
#./countMatches.sh ./output/*.matches.tsv
#Used for: counting and viewing retained reads after catalog building and matching (sstacks)
#Dependencies: Anaconda Python (for Pandas)

for file in "$@"; 
do 
wc -l $file >> matchLength; 
echo `basename $file` >> names;
done

cut -d'.' -f1 matchLength > length
paste -d, length names > matchInfo

python plotMatches.py

#rm matchLength
#rm names
