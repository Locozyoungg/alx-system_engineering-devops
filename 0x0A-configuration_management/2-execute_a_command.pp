# Puppet manifest to kill a process named killmenow using pkill

exec { 'killmenow':
  command     => 'pkill -f killmenow',
  refreshonly => true,
}
