FROM          docker.io/redhat/ubi9
RUN           useradd node && \
              curl -L https://nodejs.org/dist/v22.15.1/node-v22.15.1-linux-x64.tar.xz -o /tmp/node-v22.15.1-linux-x64.tar.xz && \
              dnf install xz -y && \
              cd /opt && \
              tar -xf /tmp/node-v22.15.1-linux-x64.tar.xz && \
              mv node-v22.15.1-linux-x64 node && \
              rm -f /tmp/node-v22.15.1-linux-x64.tar.xz && \
              dnf remove xz -y
USER          node
WORKDIR       /home/node
COPY          node_modules/  node_modules/
COPY          server.js server.js
ENTRYPOINT    [ "/opt/node/bin/node", "server.js" ]
