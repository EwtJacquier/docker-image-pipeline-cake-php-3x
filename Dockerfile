FROM ubuntu:20.04

# Mudando usuário p/ root
USER root

# Definindo diretório de trabalho
WORKDIR /eazyview

# Instalando dependências de Pacote
RUN apt-get update
RUN apt-get install zip -y
RUN apt-get install unzip -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php

# Instalando PHP 7.4 + Extensões CakePHP 3.x
RUN apt-get install php7.4 -y
RUN apt-get install php7.4-mysql php7.4-curl php7.4-mbstring php7.4-simplexml php7.4-intl php7.4-zip -y

# Instalando o SSHPass
RUN apt-get install sshpass -y

# Checando versão de PHP
RUN php -v

# Instalando Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer self-update
RUN composer --version

# Instalando Git FTP
RUN apt-get install -y git
RUN apt-get install -y lftp 
RUN apt-get install -y git-ftp

