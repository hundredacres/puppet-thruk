# Class: thruk::config
#
# This module contain the configuration for rkhunter
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include thruk::config
#
class thruk::config {


  file {
    $thruk::params::configThrukConf:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      content => template($thruk::params::configThrukConfTemplate);
  }
  file { '/etc/thruk/htpasswd':
    ensure => present,
    mode   => '0644',
    owner  => 'apache',
    group  => 'apache',
    notify => Exec['regenerate_htpasswd'],
  }
  exec { 'regenerate_htpasswd':
    command => "/usr/bin/htpasswd -bp  /etc/thruk/htpasswd ${thruk::params::thrukadminuser} ${thruk::params::thrukadmin_pass}",
  }
}
