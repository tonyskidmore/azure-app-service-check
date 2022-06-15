FROM jupyter/scipy-notebook

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

COPY templates/ templates/
COPY app.py ./app.py

# ssh
USER root
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update && \
    apt-get install -y --no-install-recommends dialog && \
    apt-get update && \
	  apt-get install -y --no-install-recommends openssh-server && \
	  echo "$SSH_PASSWD" | chpasswd

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh

RUN apt-get install -y --no-install-recommends tcptraceroute openssl

EXPOSE 5000 2222

ENTRYPOINT ["init.sh"]
