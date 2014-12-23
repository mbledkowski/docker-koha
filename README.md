docker-koha
===================

Open-source integrated library system running on container. 

to run the container ...

docker run -d -p 80 -p 8080 quantumobject/docker-koha

need to wait for few second maybe 1 min to allow the installing conf to finish.

need to run this command to check the password for user koha_library :

docker logs container_id

and then use this password to log in with user name for the web install at http://ipaddress:8080/    
note: this password will be unique for your container and need to use port assigned by docker to connect to 8080

if this page show error 500 internal server error them need to execute this command :

=====

PID=$(docker inspect --format {{.State.Pid}} <container_name_or_ID>)

nsenter --target $PID --mount --uts --ipc --net --pid

koha-post-install-setup   ===> repeat commmad to the point that apache2 reload and show ok and not fail .

exit

=======

After the web install, you should be redirected to the staff client login screen.
Login with koha user name(koha_library) and password.
Click on the More dropdown menu.
Select Administration.
Select Libraries, branches and groups under the “Basic Parameters” heading.
Click New Library and enter your information into the form.
Click Submit.
Your Library is now setup in Koha.
Create Group sear domain and add to library
Create Group propieties and add to library 
Create a new patron for staff and give superuser permision and use this one for future login (from this point don't recomend to used the koha_library user)

Execute this command next :

docker exec -it container_id after_install

The OPAC client will be at http://ipaddress:80/ The staff client will be at http://ipaddress:8080/

note: 80 and 8080 need to be replace to the external port use by docker for this two internal port ..

(sample for staff login)[http://www.quantumobject.com:49162/]

(sample for OPAC login)[http://www.quantumobject.com:49161/]
