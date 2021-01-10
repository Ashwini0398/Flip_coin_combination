#! /bin/bash -x

head=1
tail=0
count=0
count1=0
count2=0
count3=0
count4=0


while (( $count != 100 ))
do
        count_fix=0

                ((count++))

        cointoss=$((RANDOM%2))
        if(( $cointoss == $head ))
        then
                while (( $count_fix != 1 ))
                do
                        ((count_fix++))
                         cointoss=$((RANDOM%2))


                        if(( $cointoss == $head ))
                        then

                                ((count1++))

                        elif(( $cointoss == $tail ))
                        then
                                ((count2++))
                        fi
                done
        elif (( $cointoss == $tail ))
        then
                while (( $count_fix != 1 ))
                do
                        ((count_fix++))
                         cointoss=$((RANDOM%2))


                        if(( $cointoss == $head ))
                        then

                                ((count3++))

                        elif(( $cointoss == $tail ))
                        then
                                ((count4++))
                        fi
                done
        fi
done

declare -A percentage

percentage[head_head]=$( echo  $count1 $count | awk '{print $1/$2*100}' )


percentage[head_tail]=$( echo $count2 $count | awk '{print $1/$2*100}' )
percentage[tail_head]=$( echo  $count3 $count | awk '{print $1/$2*100}' )

percentage[tail_tail]=$( echo  $count4 $count | awk '{print $1/$2*100}' )
