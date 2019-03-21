FROM golang:1.8

RUN apt-get update && apt-get -y install ssh git curl nano apcupsd sudo

RUN go get github.com/linde12/gowol
RUN go get github.com/energyvault462/proxmox-monitor

WORKDIR /go/src/github.com/energyvault462/proxmox-monitor
RUN go build
RUN go install
WORKDIR /go/bin/

RUN sed -i "s/UPSCABLE smart/UPSCABLE usb/g" /etc/apcupsd/apcupsd.conf && \
    sed -i "s/NISIP 127.0.0.1/NISIP 0.0.0.0/g" /etc/apcupsd/apcupsd.conf && \
    sed -i "s/UPSTYPE apcsmart/UPSTYPE usb/g" /etc/apcupsd/apcupsd.conf && \
    sed -i "s/DEVICE \/dev\/ttyS0/DEVICE/g" /etc/apcupsd/apcupsd.conf && \
    sed -i "s/ISCONFIGURED\=no/ISCONFIGURED\=yes/g" /etc/default/apcupsd

COPY app.sh .

CMD ["/go/bin/app.sh"]
