#! /bin/bash
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo apt-get install openjdk-11-jdk -y
sudo systemctl enable jenkins
sudo systemctl restart jenkins
sudo apt install nginx -y
echo "server {
    listen 80;
    server_name jenkins.maria.esc.sh;

	location / {
		include /etc/nginx/proxy_params;
		proxy_pass          http://www.maria.jenkins.juliocesarpavan.com.br:8080;
		proxy_read_timeout  60s;
        # Fix the "It appears that your reverse proxy set up is broken" error.
        # Make sure the domain name is correct
		proxy_redirect      http://www.maria.jenkins.juliocesarpavan.com.br:8080 https://jenkins.maria.esc.sh;
	}
}" > /etc/nginx/sites-enabled/jenkins.maria.esc.sh
rm -r /etc/nginx/sites-enabled/default
sudo systemctl restart nginx