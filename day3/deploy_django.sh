#!/bin/bash
# In this script we will handle real world project error

<<task
Deploy a django app
and handle the code for errors
task

code_clone() {
	echo "cloning django app from github repository.....⭕"
	git clone https://github.com/AnasAnsari94/react_django_demo_app.git
	
}

install_requirements() {
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y
}

required_restarts() {

	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudo systemctl restart docker
}

deploy(){

	docker build -t notes-app .
	docker  run -d -p 8001:8001 notes-app:latest

}

echo "********* DEPLOYMENT STARTED **********"
if ! code_clone; then
	echo "The code directory already exist"
	cd react_django_demo_app
fi	
if ! install_requirements; then
	echo "Installation Failed"
	exit 1
fi
if ! required_restarts; then 
	echo "System fault identified"
	exit 1
fi
deploy
echo "********* DEPLOYMENT DONE **********"
