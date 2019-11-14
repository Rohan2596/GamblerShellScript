#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 14 NOV 2019

echo "Welcome to Gambler Simulation"
GAMBLER_STAKE=100;
GAMBLER_BET=1;
totalMonth=1;
totalDaysInMonth=20;
totalAmount=0;
percentage=50;
won=0
loss=0
finalWiningAmount=0
finalLossAmount=0
Final=0
winLimit=$(( $GAMBLER_STAKE + $(( $GAMBLER_STAKE * $percentage / 100  )) ))
loseLimit=$(( $GAMBLER_STAKE - $(( $GAMBLER_STAKE * $percentage / 100  )) ));

declare -A betChart
function bet(){
for (( month=0;month<=$totalMonth;month++  ))
do

for (( days=0; days<=$totalDaysInMonth; days++ ))
do
	dayStake=$GAMBLER_STAKE
	while [ $dayStake -lt $winLimit ] && [ $dayStake -gt $loseLimit ]
	do
   	check=$(( RANDOM%2 ))
		if [[ $check -eq 1  ]]
		then
			dayStake=$(( $dayStake + $GAMBLER_BET));

		else
			dayStake=$(( $dayStake - $GAMBLER_BET));
		fi
	done
echo $dayStake
dailyAmount=$(( $dayStake ))
totalAmount=$(( $totalAmount + $dailyAmount ))
betChart["Days"$days]=$dayStake
done

done
count
 echo  ${betChart[@]}
 echo	${!betChart[@]}
 }
function count(){

for data in "${!betChart[@]}"
do

if [[ ${betChart[$data]} -eq 50  ]]
then
	won=$(( $won + 1 ))
	finalWiningAmount=$(( $finalWiningAmount + 50 ))
else
	loss=$(( $loss + 1  ))
	finalLossAmount=$(( $finalLossAmount - 50 ))
fi
final=$(( $finalWiningAmount + $finalLossAmount ))
done

}
bet
