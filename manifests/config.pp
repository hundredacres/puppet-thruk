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
  $default_admin = $thruk::params::default_admin
  $htpasswd_file = $thruk::params::htpasswd_file

  file { $thruk::params::configThrukConf:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template($thruk::params::configThrukConfTemplate),
    notify  => Service['thruk'],
  }
  unless $default_admin {
    exec { 'generate_htpasswd':
      command => "htpasswd -bm  /etc/thruk/htpasswd ${thruk::params::thrukadmin_user} ${thruk::params::thrukadmin_pass}",
      unless  => "egrep '^${thruk::params::thrukadmin_user}:' /etc/thruk/htpasswd && grep ${thruk::params::thrukadmin_user}:\$(mkpasswd -S \$(egrep '^${thruk::params::thrukadminuser}:' /etc/thruk/htpasswd |cut -d : -f 2 |cut -c-2) ${thruk::params::thrukadminpass}) /etc/thruk/htpasswd",
      path    => '/bin:/sbin:/usr/bin:/usr/sbin',
    }
    exec { 'remove_defaultuser':
      command => "htpasswd -D ${htpasswd_file} thrukadmin",
      onlyif  => "egrep -q '^thrukadmin:' ${htpasswd_file}",
      path    => '/bin:/sbin:/usr/bin:/usr/sbin',
    }
  }
}
