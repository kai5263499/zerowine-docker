FROM ubuntu:14.04

ADD http://downloads.sourceforge.net/project/zerowine/Zerowine%202.0/zerowine-image-2.0.0.tar.bz2 /zerowine.bz2

RUN mkdir -p zerowine && \
    tar -jxvf /zerowine.bz2 -C zerowine && \
    rm /zerowine.bz2 && \
    apt-get update && \
    apt-get install -y qemu-kvm
