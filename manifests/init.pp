# == Class: Thruk
#
# This module manages Thruk
#
# === Parameters
#
# [*default_admin*]
#   (boolean) Maintain default admin user credentials
#   Defaults to true
#
# [*thrukadmin_user*]
#   (string) Username of admin user
#   No default
#
# [*thrukadmin_pass*]
#   (string) Password of admin user
#   No default
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

  $peer_name       = $thruk::params::peer_name,
  $peer_type       = $thruk::params::peer_type,
  $peer_path       = $thruk::params::peer_path,
  $core_conf       = $thruk::params::core_conf,
  $obj_check_cmd   = $thruk::params::obj_check_cmd,
  $obj_reload_cmd  = $thruk::params::obj_reload_cmd,
  $default_admin   = $thruk::params::default_admin,
  $thrukadmin_user = $thruk::params::thrukadmin_user,
  $thrukadmin_pass = $thruk::params::thrukadmin_pass,

) inherits thruk::params {

  if $thruk::params::linux {

    include thruk::repo
    include thruk::package
    include thruk::config
    include thruk::mod_fcgid
    include thruk::service

    Class['thruk::repo'] ->
    Class['thruk::mod_fcgid'] ->
    Class['thruk::package']   ->
    Class['thruk::config']    ->
    Class['thruk::service']

  }
}
