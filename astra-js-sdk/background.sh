#!/bin/bash
#git clone https://github.com/beccam/battlestax
git clone https://github.com/DataStax-Examples/battlestax
mv -f /root/insertGame.test.js /root/battlestax/test
sed -i 's/"0.0.13"/"latest"/' /root/battlestax/package.json
