docker-koha
===================

Open-source integrated library system running on container. 

to run the container ...

docker run -d -p 80 -p 8080 quantumobject/docker-koha

and after done with the final install at the web interface need to run this command to generate password for user koha_library :

docker exec -it container_id after_install

and then use this password to log in with user name koha_library and conf the the site for the first time at http://ipaddress:8080/ 

After the web install, you should be redirected to the staff client login screen.
Login with koha user name and password.
Click on the More dropdown menu.
Select Administration.
Select Libraries, branches and groups under the “Basic Parameters” heading.
Click New Library and enter your information into the form.
Click Submit.
Your Library is now setup in Koha.


The OPAC client with be at http://ipaddress:80/ The staff client will be at http://ipaddress:8080/
