#!/bin/sh

cd /opt/consul-template

./consul-template -config config.hcl -once

cat company.com.cert > trusted.cert
echo "" >> trusted.cert
cat company.com.cert.ca >> trusted.cert

openssl pkcs12 -export -out /opt/vault/ssl.p12 -name ssl -in trusted.cert -inkey company.com.key -password pass:password

#export SSG_SSL_KEY_PEM=$(cat company.com.key)
#export SSG_SSL_KEY_PEM_CERTS=$(cat trusted.cert)

# rm -f company.com.key
# rm -f company.com.cert
# rm -f company.com.cert.ca
# rm -f trusted.cert
# rm -f pass.txt
# rm -f license.xml