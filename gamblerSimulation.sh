#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 14 NOV 2019

echo "Welcome to Gambler Simulation"
GAMBLER_STAKE=100;
GAMBLER_BET=1;
percentage=50;
winLimit=$(( $GAMBLER_STAKE + $(( $GAMBLER_STAKE * $percentage / 100  )) ))
loseLimit=$(( $GAMBLER_STAKE - $(( $GAMBLER_STAKE * $percentage / 100  )) ));
dayStake=$GAMBLER_STAKE;
function bet(){

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
}
bet



