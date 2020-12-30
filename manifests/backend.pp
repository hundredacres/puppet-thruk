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
  Optional[String]                                  $peer_resource_file,
  Optional[String]                                  $core_conf,
  Optional[String]                                  $obj_check_cmd,
  Optional[String]                                  $obj_reload_cmd,
) {
  ensure_resource('file', "/etc/thruk/thruk_local.d/${title}.conf", {
    ensure  => present,
    owner   => apache,
    group   => apache,
    content => template('thruk/etc/thruk.backend.erb'),
  })
}
