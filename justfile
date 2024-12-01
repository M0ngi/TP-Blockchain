set positional-arguments

default:
  just --list
  
miner1:
    ~/ChainSkills/miner1/startminer1.sh

miner2:
    ~/ChainSkills/miner1/startminer2.sh

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
