#! /bin/bash -x


echo -e "Display combination of head and tail "

head=1
tail=0
count=0
count1=0
count2=0

while [ $count != 100 ]
do
((count++))
cointoss=$((RANDOM%2))
if [[ $cointoss == $head ]]
then
        ((count1++))
        echo "Heads"
elif [[ $cointoss == $tail ]]
then
        ((count2++))
        echo "Tails"
fi
done
declare -A percentage
percentage[singlet_Head]=$( echo  $count1 $count | awk '{print $1/$2*100}' )
percentage[singlet_Tail]=$( echo  $count2 $count | awk '{print $1/$2*100}')


