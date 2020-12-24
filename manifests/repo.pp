# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include thruk::repo
class thruk::repo {
  yumrepo  {'labs_consol_stable':
    enabled  => '1',
    baseurl  => 'http://labs.consol.de/repo/stable/rhel7/$basearch',
    gpgcheck => '0',
    gpgkey   => 'http://labs.consol.de/repo/stable/RPM-GPG-KEY',
  }
}
