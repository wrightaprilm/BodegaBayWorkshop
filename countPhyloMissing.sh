#Usage:
#Call using countPhyloMissingWrapper.sh


for file in "$@"
do
tail -97 $file |  head -95 > intermed
done

while read line; do   echo "$line" | tr -cd  "N" | wc -c; done <intermed> intermed_count
