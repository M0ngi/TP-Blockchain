#!/bin/bash

sudo apt-get install software-properties-common wget -y
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum cargo -y
cargo install just
export PATH="$PATH:/home/mohamedmongi_saidane/.cargo/bin"
echo 'export PATH="$PATH:/home/mohamedmongi_saidane/.cargo/bin"' > ~/.bash_aliases

mkdir -p ~/ChainSkills/miner1
mkdir -p ~/ChainSkills/miner2

cd ~/ChainSkills
cat >genesis.json <<EOL
{
"nonce": "0x0000000000000042",
"mixhash":
"0x0000000000000000000000000000000000000000000000000000000000000000",
"difficulty": "0x400",
"alloc": {},
"coinbase": "0x0000000000000000000000000000000000000000",
"timestamp": "0x00",
"parentHash":
"0x0000000000000000000000000000000000000000000000000000000000000000",
"extraData": "0x436861696e536b696c6c732047656e6573697320426c6f636b",
"gasLimit": "0xffffffff",
"config": {
 "chainId": 42,
 "homesteadBlock": 0,
 "eip155Block": 0,
 "eip158Block": 0,
 "eip150Block": 0
}
}
EOL

geth --datadir ~/ChainSkills/miner1 init genesis.json
geth --datadir ~/ChainSkills/miner2 init genesis.json

echo password > ~/password
cp ~/password ~/ChainSkills/miner1/password.sec
chmod 777 ~/ChainSkills/miner1/password.sec

cp ~/password ~/ChainSkills/miner2/password.sec
chmod 777 ~/ChainSkills/miner2/password.sec

geth --datadir ~/ChainSkills/miner1 account new --password ~/password
geth --datadir ~/ChainSkills/miner1 account new --password ~/password

geth --datadir ~/ChainSkills/miner2 account new --password ~/password
geth --datadir ~/ChainSkills/miner2 account new --password ~/password

wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.10.15-8be800ff.tar.gz
sudo tar -xvf geth-linux-amd64-1.10.15-8be800ff.tar.gz

sudo chmod +x ./geth-linux-amd64-1.10.15-8be800ff/geth
sudo cp ./geth-linux-amd64-1.10.15-8be800ff/geth /usr/local/bin/

geth version

cat > ~/ChainSkills/miner1/startminer1.sh <<EOL
#!/bin/bash

geth --identity "miner1" --networkid 42 --datadir "~/ChainSkills/miner1" --nodiscover --mine --http --http.port "8042" --port "30303" --unlock 0 --password ~/ChainSkills/miner1/password.sec --allow-insecure-unlock --ipcpath "~/ChainSkills/miner1/geth.ipc"
EOL

chmod +x ~/ChainSkills/miner1/startminer1.sh


cat > ~/ChainSkills/miner2/startminer1.sh <<EOL
#!/bin/bash

geth --identity "miner2" --networkid 42 --datadir "~/ChainSkills/miner2" --nodiscover --mine --http --http.port "8042" --port "30303" --unlock 0 --password ~/ChainSkills/miner2/password.sec --allow-insecure-unlock --ipcpath "~/ChainSkills/miner2/geth.ipc"
EOL

chmod +x ~/ChainSkills/miner2/startminer1.sh