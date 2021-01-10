#! /bin/bash -x

head=1
tail=0
count[0]=0

while [ ${count[0]} != 100 ]
do
        count_fix=0
        count_fix1=0

                ((count[0]++))

        cointoss=$((RANDOM%2))
        if (( $cointoss == $head ))
        then

                while [ $count_fix != 1 ]
                do
                        ((count_fix++))
                         cointoss=$((RANDOM%2))

                        if (( $cointoss == $head ))
                        then
                                while [ $count_fix1 != 1 ]
                                do
                                        ((count_fix1++))
                                         cointoss=$((RANDOM%2))

                                                if (( $cointoss == $head ))
                                                then
                                                        ((count[1]++))
                                                elif (( $cointoss == $tail ))
                                                then
                                                        ((count[2]++))
                                                fi
                                done
                        elif (( $cointoss == $tail ))
                        then
                                while (( $count_fix1 != 1 ))
                                do
                                        ((count_fix1++))
                                         cointoss=$((RANDOM%2))

                                                if (( $cointoss == $head ))
                                                then
                                                        ((count[3]++))
                                                elif (( $cointoss == $tail ))
                                                then
                                                        ((count[4]++))
                                                fi
                                done
                        fi

                        done

        elif (( $cointoss == $tail ))
        then
                 while [ $count_fix != 1 ]
                do

                        ((count_fix++))
                         cointoss=$((RANDOM%2))


                        if (( $cointoss == $head ))
                        then
                                while (( $count_fix1 != 1))
                                do
                                        ((count_fix1++))
                                 cointoss=$((RANDOM%2))

                                                if (( $cointoss == $head ))
                                                then
                                                        ((count[5]++))
                                                elif (( $cointoss == $tail ))
                                                then
                                                        ((count[6]++))
                                                fi
                                done
                        elif (( $cointoss == $tail ))
                        then
                                while [ $count_fix1 != 1 ]
                                do
                                        ((count_fix1++))
                                         cointoss=$((RANDOM%2))

                                                if (( $cointoss == $head ))
                                                then
                                                        ((count[7]++))
                                                elif (( $cointoss == $tail ))
                                                then
                                                        ((count[8]++))
                                                fi
                                done
                        fi
                done
        fi
done
count[9]=$((${count[1]} + ${count[2]} + ${count[3]} + ${count[4]}))
count[10]=$((${count[5]} + ${count[6]} + ${count[7]} + ${count[8]}))
count[11]=$((${count[1]} + ${count[2]}))
count[12]=$((${count[3]} + ${count[4]}))
count[13]=$((${count[5]} + ${count[6]}))
count[14]=$((${count[7]} + ${count[8]}))

declare -A percentage

percentage[Head]=$( echo ${count[9]} ${count[0]} | awk '{print $1/$2*100}'  )
percentage[Tail]=$( echo ${count[10]} ${count[0]} |  awk '{print $1/$2*100}'  )
percentage[Head_Head]=$( echo ${count[11]} ${count[0]} |  awk '{print $1/$2*100}'  )
percentage[Head_Tail]=$( echo ${count[12]} ${count[0]} |  awk '{print $1/$2*100}' )
percentage[Tail_Head]=$( echo ${count[13]} ${count[0]} |  awk '{print $1/$2*100}' )
percentage[Tail_Tail]=$( echo ${count[14]} ${count[0]} |  awk '{print $1/$2*100}' )
percentage[Head_Head_Head]=$( echo ${count[1]} ${count[0]} |  awk '{print $1/$2*100}' )
percentage[Head_Head_Tail]=$( echo ${count[2]} ${count[0]} |  awk '{print $1/$2*100}'   )
percentage[Head_Tail_Head]=$( echo ${count[3]} ${count[0]} |  awk '{print $1/$2*100}' )
percentage[Head_Tail_Tail]=$( echo ${count[4]} ${count[0]} |  awk '{print $1/$2*100}' )
percentage[Tail_Head_Head]=$( echo ${count[5]} ${count[0]} |  awk '{print $1/$2*100}' )
percentage[Tail_Head_Tail]=$( echo ${count[6]} ${count[0]} |  awk '{print $1/$2*100}'  )
percentage[Tail_Tail_Head]=$( echo ${count[7]} ${count[0]} |  awk '{print $1/$2*100}'  )
percentage[Tail_Tail_Tail]=$( echo ${count[8]} ${count[0]} |  awk '{print $1/$2*100}'  )


index=1
record=$index
number=${count[index]}

while [[ $index -le 7 ]]
do
        if [[ $number -lt ${count[index+1]} ]]
        then
                number=${count[index+1]}
                record=$((index+1))
        fi
((index++))
done
case $record in

        1)
                echo "Head_Head_Head comes most of the time"
                ;;
        2)
                echo "Head_Head_Tail comes most of the time"
                ;;
        3)
                echo "Head_Tail_Head comes most of the time"
                ;;
        4)
                echo "Head_Tail_Tail comes most of the time"
                ;;
        5)
                echo "Tail_Head_Head comes most of the time"
                ;;
        6)
                echo "Tail_Head_Tail comes most of the time"
                ;;
        7)
                echo "Tail_Tail_Head comes most of the time"
                ;;
        8)
                echo "Tail_Tail_Tail comes most of the time"
                ;;
        *)
                ;;
esac

index=11
record=$index
number=${count[index]}
while [[ $index -le 13 ]]
do

        if [[ number -lt ${count[index+1]} ]]
        then
                number=${count[index+1]}
                record=$(($index+1))
        fi
((index++))
done
case $record in

        11)
                echo "Head_Head comes most of the time"
                ;;
        12)
                echo "Head_Tail comes most of the time"
                ;;
        13)
                echo "Tail_Head comes most of the time"
                ;;
        14)
                echo "Tail_Tail comes most of the time"
                ;;
        *)
                ;;
esac

if [[ ${count[9]} -gt ${count[10]} ]]
then
        echo "Head comes most of the time"
else
        echo "Tail comes most of the time"
fi

