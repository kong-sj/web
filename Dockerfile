FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install apache2 vim curl wget net-tools libapache2-mod-jk*
RUN echo '\
JkWorkersFile /etc/libapache2-mod-jk/workers.properties \n\
JkLogFile /var/log/apache2/mod_jk.log \n\
JkLogLevel info \n\
JkShmFile /var/log/apache2/jk-runtime-status' \
>> /etc/apache2/mods-enabled/jk.load
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
RUN sed -i 's/JkWorkersFile/#/g' /etc/apache2/mods-available/jk.conf
