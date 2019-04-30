FROM docker.stable1.apimgcp.com/repository/docker-hosted/gateway:wlui-test
## Deploy consul-template to gateway
USER root
COPY consul-template/consul-template /opt/consul-template/
COPY consul-template/config.hcl /opt/consul-template/config.hcl
RUN chmod +x /opt/consul-template/consul-template
## Copying the deployment package
COPY build/gateway/ephemeral-gateway-latest.gw7 /opt/docker/rc.d/deployment.gw7
## Make restman available
RUN touch /opt/SecureSpan/Gateway/node/default/etc/bootstrap/services/restman
