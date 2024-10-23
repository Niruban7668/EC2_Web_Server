#!/bin/bash

# Function to install NGINX
install_nginx() {
    echo "Installing NGINX..."
    sudo apt update
    sudo apt install -y nginx

    echo "Creating 'Hello World' page..."
    echo "<h1>Hello World from NGINX!</h1>" | sudo tee /var/www/html/index.html
    echo "<p>OS Information: $OS_INFO</p>" | sudo tee -a /var/www/html/index.html
    echo "Configuring firewall for NGINX..."
    sudo ufw allow 'Nginx Full'

    echo "Starting NGINX..."
    sudo systemctl start nginx
    sudo systemctl enable nginx
}

# Function to install Apache
#install_apache() {
#    echo "Installing Apache..."
#    sudo apt update
#    sudo apt install -y apache2

#    echo "Creating 'Hello World' page..."
#    echo "<h1>Hello World from Apache!</h1>" | sudo tee /var/www/html/index.html

#    echo "Configuring firewall for Apache..."
#    sudo ufw allow 'Apache Full'

#    echo "Starting Apache..."
#    sudo systemctl start apache2
#    sudo systemctl enable apache2
#}

# Ask user to choose between NGINX and Apache
#read -p "Which web server would you like to install? (nginx/apache): " server_choice

#if [[ "$server_choice" == "nginx" ]]; then
OS_INFO=$(uname -a)
install_nginx
#elif [[ "$server_choice" == "apache" ]]; then
#    install_apache
#else
#    echo "Invalid choice. Please choose 'nginx' or 'apache'."
#    exit 1
#fi

# Enable UFW (firewall) if not already enabled
sudo ufw enable

echo "Setup complete! You can visit your server's IP to see the 'Hello World' page."
