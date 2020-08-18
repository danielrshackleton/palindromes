#/bin/bash
####
####
####
####


temp=$(mktemp)
reverse=$(mktemp)
temp1=$(mktemp)
reverse1=$(mktemp)
temp2=$(mktemp)
reverse2=$(mktemp)

tr '[:upper:]' [:lower:]'  |  tr -cd '[:alpha:]\n '  \
    |  tr ' '  '\n'  |  awk 'length > 2'  |  sort  |  uniq -c  |  sort -nr  >  temp


rev temp  >  reverse

paste -d " " temp reverse  |  awk '{print $1, $2, $4}'  >  temp1

rm temp reverse

rev temp1  >  reverse1

cat temp1  |  nl  >  temp2
cat reverse1  |  nl  >  reverse2


grep -Fxf temp2 reverse2  |  awk '{print $2, $3}'

rm temp1 reverse1 temp2 reverse2


