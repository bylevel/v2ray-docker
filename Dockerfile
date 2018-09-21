FROM alpine:3.7 AS builder

RUN wget https://github.com/v2ray/v2ray-core/releases/download/v3.41/v2ray-linux-64.zip
RUN unzip v2ray-linux-64.zip

FROM alpine:3.7

LABEL MAINTAINER="chronos <xielong2@qq.com>"

COPY --from=builder /v2ray-v3.41-linux-64 /v2ray
RUN mkdir -p /etc/v2ray
RUN cp /v2ray/vpoint_vmess_freedom.json /etc/v2ray/config.json

CMD [ "/v2ray/v2ray", "-config", "/etc/v2ray/config.json" ]
