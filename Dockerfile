FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
# install VIM and docker
RUN apt-get update && apt-get install -y vim apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && apt-key fingerprint 0EBFCD88 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io && usermod -a -G docker jenkins

# drop back to the regular jenkins user - good practice
USER jenkins
