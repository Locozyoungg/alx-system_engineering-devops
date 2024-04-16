# Define a class for configuring custom HTTP response header
class custom_http_response_header {
  
  # Install Nginx package
  package { 'nginx':
    ensure => installed,
  }

  # Define custom HTTP header configuration for Nginx
  file { '/etc/nginx/sites-available/default':
    ensure  => present,
    content => "server {
                  listen 80 default_server;
                  listen [::]:80 default_server;
                  server_name _;

                  add_header X-Served-By $hostname;

                  location / {
                      root /var/www/html;
                      index index.html index.htm;
                  }
              }",
    notify  => Service['nginx'],
  }

  # Ensure Nginx service is running
  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
  }
}

# Apply the custom HTTP response header configuration
include custom_http_response_header
