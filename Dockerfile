FROM vaca/s6

RUN apk -U add sudo openssh && rm -f /var/cache/apk/*
COPY sane sshd /
