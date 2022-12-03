#! /bin/bash
while read LL
do
  PP=$(echo $LL | awk '{print $1}' )
  NN=$(echo $LL | awk '{print $2}' )
# head to get rid of dups
  NN2=$(cat geant_compressed.txt | awk '{if($1=='$PP') print $2}' | head -1 )
  [ -n "$NN2" ] && echo "$PP     $NN    $NN2"
done < new_table.txt
