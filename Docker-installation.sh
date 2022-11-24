#!/bin/bash 
printf "Choose your OS:\n1-Ubuntu\n2-Centos\n"
read num
if [ $num -eq 1 ]; then

    if [ ! -x /var/lib/docker ]; then
        echo "Installing docker dependencies" | apt install apt-transport-https ca-certificates curl software-properties-common 
        echo"DownLoading Docker" 
        url -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
        echo"updating the package"| apt update -y 
        print"\nInstalling Docker\n"
        sudo apt-cache policy docker-ce
        sudo apt install docker-ce 
        print "\ndocker successfully installed\n"
        if [ "$(systemctl is-active docker)" = "active" ]; then echo"Docker is running"; else echo "Docker is not running" ; fi
        printf "\nclone wordpress on docker\n"
        mkdir wordpress
        cd wordpress
        git clone https://github.com/M4hmoudAly/docker-compose.git
        docker compose up -d
    else   
        printf"\nDocker Already installed\n" 
    fi 

if [ $num -eq 2 ]; then   
    echo "Installing required packages"
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2 
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
    printf "\nInstalling Docker\n"
    sudo yum install docker-ce -y
    printf "\nclone wordpress on docker\n"
        mkdir wordpress
        cd wordpress
        git clone https://github.com/M4hmoudAly/docker-compose.git
        docker compose up -d 
    fi
else 
    printf "\nEnter the Right Number\n" 
fi