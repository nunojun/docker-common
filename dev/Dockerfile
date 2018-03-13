FROM centos:7

MAINTAINER Bumjoon Kim <nunojun@gmail.com>

# Java 8
RUN curl -jksSLOH "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.rpm
RUN yum localinstall -q -y jdk-8u161-linux-x64.rpm
RUN rm -f jdk-8u161-linux-x64.rpm
ENV JAVA_HOME /usr/java/jdk1.8.0_161

# Maven
RUN curl -jksSLO http://www-us.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
RUN tar -xzf apache-maven-3.5.2-bin.tar.gz -C /opt
RUN rm -f apache-maven-3.5.2-bin.tar.gz
ENV PATH ${PATH}:/opt/apache-maven-3.5.2/bin

# Kerberos
#RUN yum install -q -y krb5-workstation krb5-libs krb5-auth-dialog

# Git
RUN yum install -q -y git
RUN echo $'[user]\n\
    email = nunojun@gmail.com\n\
    name = Bumjoon Kim\n[push]\n\
    default = current\n' >> /root/.gitconfig
RUN curl -jksSLO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh && \
    mv git-prompt.sh /root/.git-prompt.sh
RUN echo $'\n' >> /root/.bashrc && \
    echo "source ~/.git-prompt.sh" >> /root/.bashrc && \
    echo "export PS1='\[[\u@\h \W]\$(__git_ps1)\n\$ \]'" >> /root/.bashrc

# Vim
RUN yum install -q -y vim
RUN mkdir -p /root/.vim && \
    echo $'set et\nset nu\nset tabstop=4' >> /root/.vim/vimrc

# jq
RUN curl -jksSLO https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
    chmod a+x jq-linux64 && \
    mv jq-linux64 /usr/local/bin/jq

# Other utilities that can be installed with yum
RUN yum install -q -y tree which rpm-build

WORKDIR /work

CMD ["/bin/bash"]


