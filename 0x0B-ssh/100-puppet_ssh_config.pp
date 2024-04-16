# Define SSH client configuration file path
$ssh_config_file = "/etc/ssh/ssh_config"

# Ensure SSH client configuration file exists
file { $ssh_config_file:
  ensure => present,
}

# Configure SSH client to use the private key ~/.ssh/school
file_line { "Declare identity file":
  ensure => present,
  path   => $ssh_config_file,
  line   => "    IdentityFile ~/.ssh/school",
}

# Configure SSH client to refuse password authentication
file_line { "Turn off passwd auth":
  ensure => present,
  path   => $ssh_config_file,
  line   => "    PasswordAuthentication no",
}

