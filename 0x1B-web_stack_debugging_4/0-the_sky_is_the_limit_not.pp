# Puppet manifest to adjust Nginx configuration to handle high concurrency

# Define a class to manage Nginx configuration
class nginx_config {
  
  # Define the Nginx configuration file
  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nginx/nginx.conf.erb'),
    notify  => Service['nginx'],
  }

  # Define the Nginx service
  service { 'nginx':
    ensure     => running,
    enable     => true,
    subscribe  => File['/etc/nginx/nginx.conf'],
  }
}

# Apply the nginx_config class
include nginx_config

