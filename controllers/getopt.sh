#!/bin/sh

###### 使用命令行参数变量 ######


function handleArgs() {
	_RELEASE=false
	_ALL=false
	_WATCH=false
	_ERROR=false
	local opts
	opts=$(getopt -o aw --long all,watch -n 'parse-options' -- "$@")
	if [[ $? != 0 ]] ; then
		echo "parse arg failed!!"
		exit 1
	fi
	set -- $opts
	while [[ -n "$1" ]]
	do
		case $1 in
			\'release\')
				_RELEASE=true
				;;
			-a | --all)
				_ALL=true
				;;
			-w | --watch)
				_WATCH=true
				;;
			--)
				;;
			*)
				echo $1
				echo "unknow option"
				_ERROR=true
				;;
		esac
		shift
	done
}


handleArgs $@
if [[ $_ERROR == "true" ]] ; then
	echo "param args error"
	echo "help"
	exit 1
fi
if [[ $_RELEASE != "true" ]] ; then
	echo "help"
	exit 1
fi
###### 发布所有的文件到服务器 ######
if [[ $_ALL == "true" ]] ; then
	echo "do release all"
fi

###### 发布完之后监控文件 ######
if [[ $_WATCH == "true" ]] ; then
	echo "do watching"
else
	echo "only release all end"
	exit 0
fi
