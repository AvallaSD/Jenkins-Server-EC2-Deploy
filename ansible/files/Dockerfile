FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

EXPOSE 8080

ENTRYPOINT ["/bin/bash", "--", "/usr/local/bin/jenkins.sh"]
