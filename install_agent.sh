#! /bin/bash

mkdir -p /home/auser/TRClient/Agent/OpenLab
mkdir -p /home/auser/TRClient/Agent/OpenLab/packages
mkdir -p /home/auser/TRClient/Agent/OpenLab/configs
mkdir -p /home/auser/TRClient/Agent/OpenLab/logs


cd /home/auser/Agent/TRClient/OpenLab
if [ ! -d "./venv/bin/python" ]; then
	python -m venv venv
fi

cd /home/auser/Agent/TRClient/OpenLab/packages
wget https://github.com/QiuCronus/openlab/blob/main/openlab_agent-1.1.1-py3-none-any.whl -o openlab_agent-1.1.1-py3-none-any.whl

cd /home/auser/TRClient/Agent/OpenLab
venv/bin/pip install /home/auser/TRClient/Agent/OpenLab/packages/openlab_agent-1.1.1-py3-none-any.whl
venv/bin/pip list | grep openlab
