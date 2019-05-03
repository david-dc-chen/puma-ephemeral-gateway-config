/opt/consul-template/consul-template -config /opt/consul-template/config.hcl -once

cat /opt/consul-template/company.com.cert > /opt/consul-template/trusted.cert
cat /opt/consul-template/company.com.cert.ca >> /opt/consul-template/trusted.cert

export SSG_SSL_KEY_PEM=$(cat /opt/consul-template/company.com.key)
export SSG_SSL_KEY_PEM_CERTS=$(cat /opt/consul-template/trusted.cert)

rm -f /opt/consul-template/company.com.key
rm -f /opt/consul-template/company.com.cert
rm -f /opt/consul-template/company.com.cert.ca
rm -f /opt/consul-template/trusted.cert
rm -f /opt/consul-template/pass.txt
rm -f /opt/consul-template/license.xml