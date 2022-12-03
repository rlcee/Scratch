#! /bin/bash
#
# for each particle in the particle list, check if the geant name is the same
#
while read LL
do
  PP=$(echo $LL | awk '{print $1}' )
  NN=$(echo $LL | awk '{print $2}' )
# head to get rid of dups
  NN2=$(cat new_table.txt | awk '{if($1=='$PP') print $2}' | head -1 )
#  echo "DEBUG $PP $NN $NN2"
  [[ -z "$NN2" ]] && echo "$PP     $NN"
done < geant_compressed.txt
