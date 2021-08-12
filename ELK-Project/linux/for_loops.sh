#!/bin/bash

my_favorite_states=('Nebraska' 'Hawaii' 'California' 'Florida')
for state in ${my_favorite_states[@]}
do
echo $state
if [ $state == 'Hawaii' ];
then 
echo "Hawaii is the best"
else
echo "I'm not a fan of Hawaii"
fi
done

my_numbers=$(echo {0..9})
for number in ${my_numbers[@]}
do
if [ $number = 3 ] || [ $number = 5 ] || [ $number = 7 ]

then
echo $number
fi
done

ls_out=$(ls)
for x in ${ls_out[@]}
do
echo $x
done

