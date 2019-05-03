FROM docker.dev1.apimgcp.com/repository/docker-hosted/gateway:95
## Deploy consul-template to gateway
USER root
COPY consul-template/consul-template /opt/consul-template/
COPY consul-template/config.hcl /opt/consul-template/config.hcl
RUN chmod +x /opt/consul-template/consul-template
COPY consul-template/setup.sh /opt/consul-template/setup.sh
RUN chmod +x /opt/consul-template/setup.sh
#RUN export VAULT_ADDR=https://apim-vault:8200
#RUN export VAULT_TOKEN="df190095-e8b9-8ccd-69ce-cde8e29f19cb"
#RUN export VAULT_SKIP_VERIFY="true"
#RUN /opt/consul-template/consul-template -once -config /opt/consul-template/config.hcl

#RUN export SSG_SSL_KEY_PEM=$(cat /opt/consul-template/company.com.key)
#RUN export SSG_SSL_KEY_PEM_CERTS=dfssfsdfdsfsfsd
#
#RUN rm -f /opt/consul-template/company.com.key
#RUN rm -f /opt/consul-template/company.com.crt
#RUN rm -f /opt/consul-template/pass.txt
#RUN rm -f /opt/consul-template/license.xml
## Copying the deployment package
COPY build/gateway/ephemeral-gateway-latest.gw7 /opt/docker/rc.d/deployment.gw7
## Make restman available
RUN touch /opt/SecureSpan/Gateway/node/default/etc/bootstrap/services/restman
