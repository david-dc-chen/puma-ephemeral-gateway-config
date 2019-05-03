FROM docker.dev1.apimgcp.com/repository/docker-hosted/gateway:95
## Deploy consul-template to gateway
USER root
COPY consul-template/consul-template /opt/consul-template/
COPY consul-template/config.hcl /opt/consul-template/config.hcl
RUN chmod +x /opt/consul-template/consul-template
RUN /opt/consul-template/consul-template -config /opt/consul-template/config.hcl

ENV SSG_SSL_KEY_PEM=$(cat /opt/consul-template/company.com.key)
ENV SSG_SSL_KEY_PEM_CERTS=$(cat /opt/consul-template/company.com.crt)

RUN rm -f /opt/consul-template/company.com.key
RUN rm -f /opt/consul-template/company.com.crt
RUN rm -f /opt/consul-template/pass.txt
RUN rm -f /opt/consul-template/license.xml
## Copying the deployment package
COPY build/gateway/ephemeral-gateway-latest.gw7 /opt/docker/rc.d/deployment.gw7
## Make restman available
RUN touch /opt/SecureSpan/Gateway/node/default/etc/bootstrap/services/restman
