#!/bin/bash

screen -X -S analyzer quit
screen -X -S replay quit
#

sleep 5

cd /home/wehe_py3/wehe-py3/src/

#screen -S analyzer  sudo python3 replay_analyzerServer.py --ConfigFile=configs.cfg --original_ports=True

echo Started replay analyzer

sleep 5

#screen -S replay  sudo python3 replay_server.py --ConfigFile=configs.cfg --original_ports=True

echo Started replay server
