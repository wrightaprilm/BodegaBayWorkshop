#Usage:
#./countReads.sh filepath
#./countReads.sh ./output/*.fq
#Used for: counting and viewing retained reads after process_rad.sh
#Dependencies: Anaconda Python (for Pandas)

for file in "$@"; 
do 
echo `basename $file` >> names
grep '+' $file | wc -l >> readCounts; 
done

paste -d, names readCounts > counts

python plotReads.py

#rm names
#rm readCounts
