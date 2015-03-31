# == Class: Thruk
#
# This module manages Thruk
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { '::thruk':
#  }
#or
#
#  include ::thruk
#
# === Authors
#
# Author Karen Harutin <karen@inutis.eu
#
#
class thruk (
) inherits thruk::params {

  if $thruk::params::linux {

  include thruk::package
  include thruk::config
  include thruk::mod_fcgid
  include thruk::service

  Class['thruk::mod_fcgid'] ->
  Class['thruk::package']   ->
  Class['thruk::config']    ->
  Class['thruk::service']

  }
}