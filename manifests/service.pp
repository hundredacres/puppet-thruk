#= Class: thruk::service
#
class thruk::service {
  service  {'thruk':
    ensure   => running,
  }
}
