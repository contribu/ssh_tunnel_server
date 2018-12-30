FROM ubuntu:xenial

ENV APP_ROOT /root
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
WORKDIR $APP_ROOT

RUN apt-get update \
  && apt-get upgrade \
  && apt-get install -y openssh-server net-tools ruby \
  && mkdir -p /root/.ssh \
  && chmod 700 /root/.ssh \
  && echo https://github.com/ansible/ansible-container/issues/141 \
  && mkdir -p /var/run/sshd

COPY . $APP_ROOT
CMD ["/root/boot.sh"]
