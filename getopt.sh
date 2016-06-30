#!/bin/sh

###### 使用命令行参数变量 ######

function handleArgs() {
	echo "getopt a "$@""
	set `getopt a "$@"`
	while [[ -n "$1" ]]
	do
		echo $1
		case $1 in
			-a)
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

handleArgs "$@"
