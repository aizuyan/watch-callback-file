#!/bin/sh

function scandir(){
	local workdir curdir realpath

	workdir=$1

	if [[ -z "${workdir}" ]] ; then
		echo "遍历的目录为空"
		exit 1
	fi

	if [[ ! -d "$workdir" ]] ; then
		echo "遍历的目录【${workdir}】不存在"
		exit 1
	fi

	cd $workdir
	curdir=$(pwd)

	for dir in $(ls $curdir)
	do
		realpath="${curdir}/$dir"
		if [[ -f "${realpath}" ]]; then
			echo "${curdir}/$dir"
		elif [[ -d "${realpath}" ]]; then
			scandir $realpath
		fi
	done
}

scandir $1
