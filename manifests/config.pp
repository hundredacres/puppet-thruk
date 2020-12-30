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
class thruk::config inherits thruk {
  $default_admin = $thruk::default_admin
  $htpasswd_file = $thruk::htpasswd_file

  file { $thruk::params::configthrukconf:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template($thruk::params::configthrukconftemplate),
    notify  => Service['thruk'],
  }
  unless $default_admin {
    exec { 'generate_htpasswd':
      command => "htpasswd -bs  /etc/thruk/htpasswd ${thruk::thrukadmin_user} ${thruk::thrukadmin_pass}",
      unless  => "egrep '^${thruk::thrukadmin_user}:' /etc/thruk/htpasswd && grep ${thruk::thrukadmin_user}:\$(mkpasswd -S \$(egrep '^${thruk::thrukadmin_user}:' /etc/thruk/htpasswd |cut -d : -f 2 |cut -c-2) ${thruk::thrukadmin_pass}) /etc/thruk/htpasswd",
      path    => '/bin:/sbin:/usr/bin:/usr/sbin',
    }
    exec { 'remove_defaultuser':
      command => "htpasswd -D ${htpasswd_file} thrukadmin",
      onlyif  => "egrep -q '^thrukadmin:' ${htpasswd_file}",
      path    => '/bin:/sbin:/usr/bin:/usr/sbin',
    }
  }
}
