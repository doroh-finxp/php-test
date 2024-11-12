#!/bin/bash
apt install -y libaio1 
 if [ "$(php -m | grep oci8)" != "oci8" ]; then apt install -y unzip libaio1 
    mkdir -p /home/site/ini 
    wget -O /home/instantclient-basic-linux.x64-23.4.0.24.05.zip https://download.oracle.com/otn_software/linux/instantclient/2340000/instantclient-basic-linux.x64-23.4.0.24.05.zip 
    unzip -o /home/instantclient-basic-linux.x64-23.4.0.24.05.zip -d /home 
    wget -O /home/instantclient-sdk-linux.x64-23.4.0.24.05.zip https://download.oracle.com/otn_software/linux/instantclient/2340000/instantclient-sdk-linux.x64-23.4.0.24.05.zip 
    unzip -o /home/instantclient-sdk-linux.x64-23.4.0.24.05.zip -d /home 
    wget -O /home/oci8-3.4.0.tgz https://pecl.php.net/get/oci8-3.4.0.tgz 
    tar -xvzf /home/oci8-3.4.0.tgz -C /home 
    cd /home/oci8-3.4.0 
    phpize 
    ./configure -with-oci8=shared,instantclient,/home/instantclient_23_4 
    echo "extension=/home/oci8-3.4.0/modules/oci8.so" >> /home/site/ini/setting.ini 
    make install 
 fi 
 service nginx restart