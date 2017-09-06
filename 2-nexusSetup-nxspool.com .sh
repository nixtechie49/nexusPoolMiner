#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install build-essential libboost-all-dev libdb-dev libdb++-dev libssl-dev libminiupnpc-dev libgmp-dev screen git nano -y

git clone https://github.com/hg5fm/PrimePoolMiner.git PrimePoolMiner

cd PrimePoolMiner

make MARCHFLAGS=-march=native -f makefile


cat > miner.conf << EOF
{
  "host": "nxspool.com",
  "port": "9549",
  "nxs_address": "2QkgKaWzcchTdQUuEKbuRWpcUKtmwxKRoQq5ksB4P6D8n5JaY2w",
  "sieve_threads": 27,
  "ptest_threads": 32,
  "timeout": 10,
  "bit_array_size": 2097152,
  "prime_limit": 71378571,
  "n_prime_limit": 3000000,
  "primorial_end_prime": 12,
  "experimental": "true"
}
EOF

sudo ./nexus_cpuminer


