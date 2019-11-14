#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 14 NOV 2019

echo "Welcome to Gambler Simulation"
GAMBLER_STAKE=100;
GAMBLER_BET=1;
totalDaysInMonth=20;
totalAmount=0;
percentage=50;
winLimit=$(( $GAMBLER_STAKE + $(( $GAMBLER_STAKE * $percentage / 100  )) ))
loseLimit=$(( $GAMBLER_STAKE - $(( $GAMBLER_STAKE * $percentage / 100  )) ));

declare -A betChart
function bet(){
for (( days=0; days<$totalDaysInMonth; days++ ))
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
dailyAmount=$(( $dayStake - $GAMBLER_STAKE ))
totalAmount=$(( $totalAmount + $dailyAmount ))
betChart["Days"$days]=$dayStake
done
}
bet


