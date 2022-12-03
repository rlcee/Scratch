#! /bin/bash
#
# rewrite existing table (modified hepPDT) with geant names
#

# this will prevent shell expansion of "*" so we can more
# easily deal with names that contain that char
set -o noglob

rm new_table.txt

while read LL
do
    #echo "LL=$LL"
    ID=$(echo $LL | awk '{print $1}')
    NAME="$(cat geant_compressed.txt | awk -v id=$ID '{ if($1==id) print $2 }' | head -1 )"
    if [ -z "$NAME" ]; then
        NAME=$(echo $LL | awk '{printf "%s", $2}')
        NAME=$(echo "$NAME" | sed 's/\^//g' )
        if [[ "$NAME" =~ "~" ]]; then
            NAME=$(echo "$NAME" | sed 's/~//g' )
            NAME="anti_${NAME}"
        fi
    fi
    #echo "NAME=$NAME"

    CNAME=$( cat PDGCode.txt | awk -v id=$ID '{if($1==id) print $2}' )
    if [ -z "$CNAME" ]; then
        CNAME=$( echo "$NAME" | sed -e 's/*/_star/g' -e 's/++$/_pp/g' -e 's/+$/_plus/g'  -e 's/\-\-$/_mm/g' -e 's/\-$/_minus/g' -e 's/\-/_/g' -e 's/(//' -e 's/)//' -e 's/\[/_/'  -e 's/\]//'  -e 's/\./_/'  -e "s/'/_prime/" )
        echo "MOD CNAME $NAME $CNAME"
        [ -z "$CNAME" ] && CNAME=error
    fi
    #echo "CNAME=$CNAME"
    #echo "LL2=$LL"

    NEWLL=$( echo $LL | awk -v nn="$NAME" -v cc="$CNAME" '{print $1 " " nn " " cc " none "  $3 " " $4 " " $5}' )
    #echo "NEWLL=$NEWLL"
    #echo "$NEWLL" >> new_table.txt
    #printf "%10s %20s %10s %10s %10s\n", "$NEWLL" >> new_table.txt
    echo "$NEWLL" | awk '{printf "%10s %22s %35s %10s %10s %12s %12s\n",$1,$2,$3,$4,$5,$6,$7}' >> new_table.txt
done < old_table.txt
