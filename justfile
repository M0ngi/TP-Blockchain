set positional-arguments

default:
  just --list
  
miner1:
    ~/ChainSkills/miner1/startminer.sh

miner2:
    ~/ChainSkills/miner2/startminer.sh

alias cd-m1 := cd-miner1
cd-miner1:
    cd ~/ChainSkills/miner1/

alias cd-m2 := cd-miner2
cd-miner2:
    cd ~/ChainSkills/miner2/

alias a-m1 := a-miner1
a-miner1:
    geth attach ~/ChainSkills/miner1/geth.ipc

alias a-m2 := a-miner2
a-miner2:
    geth attach ~/ChainSkills/miner2/geth.ipc

install-geth:
    wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.10.15-8be800ff.tar.gz
    sudo tar -xvf geth-linux-amd64-1.10.15-8be800ff.tar.gz

    sudo chmod +x ./geth-linux-amd64-1.10.15-8be800ff/geth
    sudo cp ./geth-linux-amd64-1.10.15-8be800ff/geth $(which geth)

    geth version

create-folders:
    mkdir -p ~/ChainSkills/miner1
    mkdir -p ~/ChainSkills/miner2