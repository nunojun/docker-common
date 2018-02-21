FROM centos:7

MAINTAINER Bumjoon Kim <bumjoon_kim@comcast.com>

# Install Docker CE
RUN yum -y update
RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce

# Install Git
RUN yum install -y git

# Install Java 8 (8u131)
RUN curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm \
    -o ./jdk.rpm \
    && rpm -ivh ./jdk.rpm \
    && rm -f ./jdk.rpm

# Install Maven (3.5.2)
RUN curl -O http://www-us.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
RUN tar -xzvf /apache-maven-3.5.2-bin.tar.gz -C /opt && rm -f /apache-maven-3.5.2-bin.tar.gz
ENV JAVA_HOME=/usr/java/jdk1.8.0_131
ENV PATH=/opt/apache-maven-3.5.2/bin:$PATH

# Install Jenkins (2.89.2)
RUN yum install -y wget
RUN mkdir -p /opt/jenkins/war/2.89.2
RUN wget -P /opt/jenkins/war/2.89.2 https://updates.jenkins-ci.org/download/war/2.89.2/jenkins.war
ENV JENKINS_HOME /var/jenkins_home

# Default command to run Jenkins
ENTRYPOINT ["java", "-jar", "/opt/jenkins/war/2.89.2/jenkins.war"]
