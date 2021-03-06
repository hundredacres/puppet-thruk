# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   thruk::backend { 'namevar': }
define thruk::backend (
  String                                            $peer_name,
  Enum['livestatus', 'configonly', 'http', 'mysql'] $peer_type,
  String                                            $peer_path,
  Optional[Integer]                                 $hidden                    = undef,
  Optional[String]                                  $peer_resource_file        = undef,
  Optional[String]                                  $peer_resource_file_source = undef,
  Optional[String]                                  $core_conf                 = undef,
  Optional[String]                                  $obj_check_cmd             = undef,
  Optional[String]                                  $obj_reload_cmd            = undef,
) {
  if ($peer_resource_file) {
    ensure_resource('file', $peer_resource_file, {
      ensure => present,
      owner  => apache,
      group  => apache,
      source => $peer_resource_file_source,
    })
  }
  ensure_resource('file', "/etc/thruk/thruk_local.d/${title}.conf", {
    ensure  => present,
    owner   => apache,
    group   => apache,
    content => template('thruk/etc/thruk.backend.erb'),
  })
}
