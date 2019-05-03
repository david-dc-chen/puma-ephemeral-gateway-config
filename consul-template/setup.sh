export SSG_SSL_KEY=$(cat /opt/consul-template/company.com.key)
export SSG_SSL_KEY_PEM=abcd

rm -f /opt/consul-template/company.com.key
rm -f /opt/consul-template/company.com.crt
rm -f /opt/consul-template/pass.txt
rm -f /opt/consul-template/license.xml