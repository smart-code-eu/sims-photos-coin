FROM ethereum/client-go

ARG ACCOUNT_PASSWORD
ENV ACCOUNT_PASSWORD_ENV=${ACCOUNT_PASSWORD}

COPY genesis.json .

COPY keystore /root/.ethereum/keystore

COPY mine-when-need.js /root/scripts/mine-when-need.js

RUN geth init ./genesis.json \ 
        && rm -f ~/.ethereum/geth/nodekey \
        && echo ${ACCOUNT_PASSWORD_ENV} > password.txt
    
ENTRYPOINT ["geth"]