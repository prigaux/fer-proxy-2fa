#!/bin/bash
 
## Renouvellement de la clé AES de l'IdP Shibboleth
IDP_HOME=/opt/shibboleth-idp
#export JAVA_HOME=/usr/java/latest/
 
$IDP_HOME/bin/seckeygen.sh \
    --storefile $IDP_HOME/credentials/sealer.jks \
    --versionfile $IDP_HOME/credentials/sealer.kver \
    --alias secret \
    --storepass "$(grep '^idp.sealer.storePassword' $IDP_HOME/credentials/secrets.properties | sed -n 's/.* *= *//p')"
