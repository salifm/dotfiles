#!/usr/bin/bash

function f_main() {
	local f_name="$1"

	local f_type=$(zenity --list --text "Create New:" --column "" --hide-header File Folder)
	case "$f_type" in
		"File") f_create_ff "touch" "File" "$f_name";;
    	"Folder") f_create_ff "mkdir -p" "Folder" "$f_name";;
    	*) return 0;;
	esac
}

function f_create_ff {
	local f_cmd="$1"
	local f_type="$2"
	local f_parent="$3"

	local f_name=$(zenity --entry --text "$f_type Name:")
	if [ -z "$f_name" ]; then
		return 0
	fi
	local f_full_name="$f_parent/$f_name"
	if [ -e "$f_full_name" ]; then
		z_error "$f_type $f_full_name already exist!"
		f_create_ff "$f_cmd" "$f_type" "$f_parent"
		return 0
	else
		if f_error="$($f_cmd "$f_full_name" 2>&1)"; then
    		return 0
		else
			z_error "$f_error"
			return 1
		fi
	fi
}

function z_info() {
	zenity --info --width=300 --text "$1"
}

function z_error() {
	zenity --error --width=300 --text "$1"
}

f_main $@