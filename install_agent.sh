#! /bin/bash

version="$1"
root=/home/auser/TRClient/Agent/OpenLab

mkdir -p $root
mkdir -p $root/configs
mkdir -p $root/packages
mkdir -p $root/logs

cd $root
if [ ! -d "$root/venv/bin/python" ]; then
	python -m venv $root/venv
        $root/venv/bin/pip install -q --upgrade pip
	$root/venv/bin/pip -V
fi

cd $root/packages
wget https://github.com/QiuCronus/openlab/releases/download/v1.1.1/openlab_agent-${version}-py3-none-any.whl

cd $root
venv/bin/pip install -q $root/packages/openlab_agent-${version}-py3-none-any.whl
venv/bin/pip list | grep openlab
