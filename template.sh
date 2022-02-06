#! /usr/bin/env bash
# =============================================================================
#  ___   / _|   ___   _ __   _ __     ___  | |_ 
# / __| | |_   / _ \ | '__| | '_ \   / _ \ | __|
# \__ \ |  _| |  __/ | |    | | | | |  __/ | |_ 
# |___/ |_|    \___| |_|    |_| |_|  \___|  \__|
# 
# Name       : bash_template.sh
# Version    : v0.0
# Description: bash script template
# Arguments  : describe arguments here
# Returns    : describe expected return and possible errors
# Notes      : additional notes like dependencies, bugs, todo's and fixes
#
# =============================================================================
# - Functions: ----------------------------------------------------------------
funcName(){

	# Description: put a short descrption of the function's purpose
	# Arguments  : 
	#       -1: list arguments
	#       -2: ...
	# Returns    :
	#       -0: success
	#       -1: error ...
	#       -2: error ...
	# Notes
	#       add notes like reasoning, bugs and fixes and improvements

	typeset func_name="${FUNCNAME}"
	typeset arg_list="${@}"
	typeset -i rc=0

	echo "called in ${func_name} with arguments: ${arg_list}"
	sleep ${1}

	return ${rc}	
}


# -----------------------------------------------------------------------------
main(){

	# Description: runtime entry point
	# Arguments  : parses script's ${0} ${@}
	# Returns    : 
	#	sucess   : 0
	#	error    : parses last error received
	# Notes      : this function is an auxiliary entry point:
	#                sets process control variables;
	#                sources scripts and libaries;
	#                orchestrates the process flow.

	# process start timestamp
	typeset start_time=$( date +"%Y-%m-%d %T.%N" )
	# script call full path
	typeset execpath="${0}"
	# script basename
	typeset script="${execpath##*/}"
	# process PID
	typeset -i pid=$$
	# process argument values
	typeset arg_v="${@}"
	# process argument count
	typeset -i arg_c=${#@}

	typeset func_name="${FUNCNAME}"
	typeset -i rc=0

	# source libs and scripts
	# . /path/to/shell_lib_file

	# orchestrate business logic here
	funcName 2
	rc=${?}

	typeset end_time=$(date +"%Y-%m-%d %T.%N")
	
	# debug info
	echo "start   : ${start_time}"
	echo "execpath: ${execpath}"
	echo "script  : ${script}"
	echo "pid     : ${pid}"
	echo "arg_v   : ${arg_v}"
	echo "arg_c   : ${arg_c}"
	echo "function: ${func_name}"
	echo "end     : ${end_time}"

	return ${rc}
}


# =============================================================================
# - Main : --------------------------------------------------------------------
# evaluate if script is to be sourced or executed
if [ "${0}" != "bash" ]; then
	# run script
	main "${@}"
else
	# source file; needed unset variables and functions
	unset main	
fi


