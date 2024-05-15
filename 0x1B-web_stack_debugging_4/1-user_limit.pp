# Puppet manifest to adjust the OS configuration to increase the file limit for the holberton user

# Define a class to manage the OS configuration for the holberton user
class user_limit {
  
  # Define the limits configuration file
  file { '/etc/security/limits.d/holberton.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "holberton soft nofile 8192\nholberton hard nofile 8192\n",
  }

  # Apply the limits immediately
  exec { 'apply_limits':
    command     => 'ulimit -n 8192',
    refreshonly => true,
    subscribe   => File['/etc/security/limits.d/holberton.conf'],
  }
}

# Apply the user_limit class
include user_limit

