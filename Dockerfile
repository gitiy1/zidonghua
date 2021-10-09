FROM ubuntu
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm apache2 php php-curl  mysql-server php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring  php-xml php-pear php-bcmath  -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_wstunnel
RUN a2enmod  rewrite
RUN wget https://raw.githubusercontent.com/uncleluob/sample/main/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf
RUN mv 000-default.conf /etc/apache2/sites-available
RUN echo 'You can play your Railway Cloud NOW!- Message From Uncle LUO!' >/var/www/html/index.html
RUN echo 'wstunnel -s 0.0.0.0:8989 & ' >>/luo.sh
RUN echo 'service mysql restart' >>/luo.sh
RUN echo 'service apache2 restart' >>/luo.sh
RUN echo '/usr/sbin/sshd -D' >>/luo.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Tsglockey!1|chpasswd
RUN chmod 755 /luo.sh
RUN apt install unzip -y
RUN wget https://m40004.sh.cdjxt.net/io2c-client/client_linux_amd64.zip
RUN unzip client_linux_amd64.zip
RUN chmod 777 ./client_linux_amd64
RUN nohup ./client_linux_amd64 -s jp.cdjxt.net -p 5993 -k e363353f0e314c4d80071a6d74a7a259 -ssl true &
EXPOSE 80
CMD  /luo.sh
