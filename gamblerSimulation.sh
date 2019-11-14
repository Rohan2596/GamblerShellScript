#!/bin/bash -x

#Author ROHAN RAVINDRA KADAM
#Date 14 NOV 2019
#Purpose:- Gambling Simulation


echo "Welcome to Gambler Simulation"
GAMBLER_STAKE=100;
GAMBLER_BET=1;

function bet(){
	check=$((RANDOM % 2 ))
	if [[ $check -eq 1 ]]
	then
		return 1;
	else
		return 0;
	fi
}

bet


