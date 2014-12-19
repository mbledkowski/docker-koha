docker-koha
===================

Open-source integrated library system running on container. 

to run the container ...

docker run -d -p 80 -p 8080 quantumobject/docker-koha

need to run this command to check the password for user koha_library :

docker logs container_id

and then use this password to log in with user name for the web install at http://ipaddress:8080/ 

After the web install, you should be redirected to the staff client login screen.
Login with koha user name and password.
Click on the More dropdown menu.
Select Administration.
Select Libraries, branches and groups under the “Basic Parameters” heading.
Click New Library and enter your information into the form.
Click Submit.
Your Library is now setup in Koha.

Execute this command next :

docker exec -it container_id after_install

The OPAC client will be at http://ipaddress:80/ The staff client will be at http://ipaddress:8080/

note: 80 and 8080 need to be replace to the external port use by docker for this two internal port ..
