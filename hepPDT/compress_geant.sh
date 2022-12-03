#! /bin/bash
cat geant_particles.txt | \
 awk '{
if($2=="Name") name=$4;
if($3=="code") code=$5;
if($1=="Mass") mass=$4*1000.0;
if($1=="Charge") charge=$3;
if($1=="Lifetime") lifetime=$4;
if($1=="Parity") print(code," ",name," ",charge," ",mass," ",lifetime);
}'

