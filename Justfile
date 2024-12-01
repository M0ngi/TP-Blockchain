miner1:
    ~/ChainSkills/miner1/startminer1.sh

miner2:
    ~/ChainSkills/miner1/startminer2.sh

a-miner1:
    geth attach ~/ChainSkills/miner1/get.ipc

a-miner2:
    geth attach ~/ChainSkills/miner2/get.ipc
