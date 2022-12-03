#! /bin/bash
cat $1 | awk '{print sqrt($1*$1)," ",$0}' > tmp.txt
cat tmp.txt | sort -k1,1 -n > tmp2.txt
cat tmp2.txt | awk '{for(i=2;i<=NF;i++) printf " %s",$i; printf "\n"}' > tmp3.txt


