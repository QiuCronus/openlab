#! /bin/bash


check_params(){
	if [ -z "$2" ];then
		echo "param: $1 is empty."
		exit
	fi
}

write_file(){
	echo "$1" >> $cfg
}



mkdir -p /home/auser/supervisord.d
cfg=agent.ini

module=$1
category=$2
submodule=$3
config=$4
vhost=$5
dbname=$6

check_params "module" $module
check_params "category" $category
check_params "submodule" $submodule
check_params "config" $config
check_params "vhost" $vhost

cmd="/home/auser/TRClient/Agent/OpenLab/venv/bin/openlab_agent $submodule -m $module -f $config --vhost $vhost"
if [ -n "$dbname" ]; then
	cmd="$cmd --dbname $dbname"
fi

prog=${module}Agent${category}_${submodule}

write_file " "
write_file "[program:$prog]"
write_file "directory=/home/auser/TRClient/Agent/OpenLab"
write_file "command=$cmd"
write_file "autostart=false"
write_file "stopasgroup=true"
write_file "killasgroup=true"
write_file "autorestart=true"
write_file "startsecs=5"
write_file "startretries=3"
write_file "stdout_logfile=/home/auser/TRClient/Agent/OpenLab/logs/$prog.log"
write_file "redirect_stderr = true"
write_file "stdout_logfile_maxbytes = 300MB"
write_file "stdout_logfile_backups = 2"
write_file "user=auser"
