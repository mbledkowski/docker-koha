# docker-koha

Docker container for [koha 18.11][3]

"Koha Library Software:The world's first free and open source library system. Koha is a fully featured, scalable library management system. Development is sponsored by libraries of varying types and sizes, volunteers, and support companies worldwide."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 18.04 use the commands:

    $ sudo apt-get update
    $ sudo wget -qO- https://get.docker.com/ | sh

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d --cap-add=SYS_NICE --cap-add=DAC_READ_SEARCH -p 80:80 -p 8080:8080 quantumobject/docker-koha

note: koha used  Apache/mpm itk that create some problem under docker, there are some sites that recommend to add this to pre-view command :   --cap-add=SYS_NICE --cap-add=DAC_READ_SEARCH

Them you need to wait for few second maybe 1 min to allow the installing conf to finish and run this command to check the password for user koha_library :

    $ docker logs container_id

## Accessing the Koha applications:

After that check with your browser at addresses plus the port assigined by docker for correspoding port 8080:

  - **http://host_ip:port/**
  
and then use this password to log in with user name koha_library for the web install if this page show error 500 internal server error them need to execute this command:

    $ docker exec -it container_id /bin/bash
    $ koha-post-install-setup
    $ exit

repeat commmad to the point that apache2 reload and show ok and not fail and try againg to access the web install procedure. I recomend if your fisrt time using Koha that choose all the options posible on the install , you will be able to remove stuff later. 

After the web install, you should be redirected to the staff client login screen.

## First Configuration of Koha:

  You need to follow the instruction from [https://koha-community.org/manual/18.11/en/html/installation.html#web-installer]
 
Execute this command next:

    $ docker exec -it container_id after_install

The OPAC client will be at http://ipaddress:80/ 

The staff client will be at http://ipaddress:8080/

note: 80 and 8080 need to be replace to the external port use by docker for this two internal port . If you need to restart the container for any reason, there is a chance that you need to reload Apache2 internally of the container to work again (still looking for a permanent solution of this problem)

if you see problem with “500 Internal Server Error” you need to

    $ docker exec -it container_id /bin/bash
    $ /etc/init.d/apache2 restart ==> if fail, do it again ..

and them try to access it again. This happend the first time installed and when container been stop and started (like when rebooting the server)


## More Info

About Koha: [www.koha-community.org][1]

To help improve this container [quantumobject/docker-koha][5]

For additional info about us and our projects check our site [www.quantumobject.org][8]

[1]:http://koha-community.org/
[2]:https://www.docker.com
[3]:http://koha-community.org/documentation/
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-koha
[8]:http://www.quantumobject.org/
