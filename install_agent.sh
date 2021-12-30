#! /bin/bash

root=/home/auser/TRClient/Agent/OpenLab

mkdir -p $root
mkdir -p $root/configs
mkdir -p $root/packages
mkdir -p $root/logs

cd $root
if [ ! -d "./venv/bin/python" ]; then
	python -m venv venv
fi

cd $root/packages
wget https://github.com/QiuCronus/openlab/blob/main/openlab_agent-1.1.1-py3-none-any.whl -o openlab_agent-1.1.1-py3-none-any.whl

cd $root
venv/bin/pip install $root/packages/openlab_agent-1.1.1-py3-none-any.whl
venv/bin/pip list | grep openlab
