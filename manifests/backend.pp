# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   thruk::backend { 'namevar': }
define thruk::backend (
  $peer_name       = $thruk::peer_name,
  $peer_type       = $thruk::peer_type,
  $peer_path       = $thruk::peer_path,
) {
  ensure_resource('file', "/etc/thruk/thruk_local.d/${title}.conf", deep_merge($peer_name,$peer_type,$peer_path))
}
