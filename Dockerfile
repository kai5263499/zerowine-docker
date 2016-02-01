FROM alpine

RUN apk update && apk add wget subversion python wine tcpdump py-pip
RUN svn checkout http://svn.code.sf.net/p/zerowine-tryout/code/trunk zerowine
RUN    pip install pip --upgrade \
	&& pip install pefile \
	&& ln -s /zerowine/source /home/malware \
	&& ln -s /usr/bin/wine64 /usr/bin/wine \
	&& mkdir -p /tmp/vir

RUN    echo "Downloading TRiD and Database..." \
    && wget http://mark0.net/download/trid_linux_64.zip -O /tmp/trid_linux_64.zip \
    && wget http://mark0.net/download/triddefs.zip -O /tmp/triddefs.zip \
    && cd /tmp \
    && unzip trid_linux_64.zip \
    && unzip triddefs.zip \
    && chmod +x trid \
    && mv trid /usr/bin/ \
    && mv triddefs.trd /usr/bin/ \
    && ln -s /usr/bin/trid /home/malware/nongpl/bin/trid

EXPOSE 8000

WORKDIR /zerowine/source/zerowine
CMD "./pycgiserver.py"
