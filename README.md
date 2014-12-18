docker-koha
===================

Open-source integrated library system running on container. 

to run the container ...

docker run -d -p 80 -p 8080 quantumobject/docker-koha

and after done with the final install at the web interface need to run this command to generate password for user koha_library :

docker exec -it container_id after_install

and the use this password to log in and conf the first time at http://ipaddress:80/ 

The OPAC client with be at http://ipaddress:80/ The staff client will be at http://ipaddress:8080/
