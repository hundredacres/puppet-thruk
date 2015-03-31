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
class rkhunter::config {


  file {
    $rkhunter::params::configThrukConf:
      ensure  => present,
      mode    => '0640',
      owner   => root,
      group   => root,
      path    => $rkhunter::params::configRkhunterConf,
      content => template($thruk::params::configThrukConfTemplate);
  }

}
