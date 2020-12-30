#= Class: thruk::service
#
class thruk::service {
  service  {'httpd':
    ensure   => running,
  }
}
