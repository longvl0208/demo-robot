FROM centos:7
COPY . /app

LABEL key="longvl"

LABEL name="Docker build for acceptance testing using the robot framework"

RUN yum -y update
RUN yum -y install wget
RUN yum -y install java-1.8.0-openjdk-devel
# RUN yum -y install curl
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum -y install jenkins
#RUN rpm -i /app/jenkins.rpm
# RUN systemctl start jenkins
# RUN systemctl status jenkins
# RUN systemctl enable jenkins
# RUN firewall-cmd --permanent --zone=public --add-port=8080/tcp
# RUN firewall-cmd --reload
RUN yum -y install python3 && pip3 install robotframework 
COPY jenkins_config /etc/rc.d/init.d/jenkins
#ADD startup-script.sh /startup-script.sh
#RUN chmod +x /startup-script.sh
CMD ["/usr/sbin/init"]
EXPOSE 8080

