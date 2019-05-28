## Put consul-template inside container
FROM hexedpackets/curl
USER root
COPY consul-template/consul-template /opt/consul-template/
COPY consul-template/config.hcl /opt/consul-template/config.hcl
COPY consul-template/ssl.p12 /opt/consul-template/ssl.p12
RUN chmod +x /opt/consul-template/consul-template
COPY consul-template/setup.sh /opt/consul-template/setup.sh
RUN chmod +x /opt/consul-template/setup.sh


#FROM docker.stable1.apimgcp.com/repository/docker-hosted/gateway:94
### Copying the deployment package
#COPY build/gateway/ephemeral-gateway-latest.gw7 /opt/docker/rc.d/deployment.gw7
#
### Make restman available
#RUN touch /opt/SecureSpan/Gateway/node/default/etc/bootstrap/services/restman

