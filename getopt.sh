#!/bin/sh

###### 使用命令行参数变量 ######

function handleArgs() {
	local opts
	opts=$(getopt -o r --long release -n 'parse-options' -- "$@")
	if [[ $? != 0 ]] ; then
		echo "parse arg failed!!"
		exit 1
	fi
	set -- $opts
	while [[ -n "$1" ]]
	do
		case $1 in
			-r | --release)
				echo "do push all file to server"
				;;
			--)
				shift
				break
				;;
			*)
				echo $1
				echo "unknow option"
		esac
		shift
	done
}

handleArgs --release
