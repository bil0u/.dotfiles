#!/bin/zsh

function in_env() # Returns 0 if the passed variable name is set in env, 1 otherwise
{
	if [[ -z "$1" ]]
	then
		return 1
	else
		return 0
	fi
}
