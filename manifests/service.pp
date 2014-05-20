class avahi::service() {

  case $::operatingsystem {
    centos,fedora,rhel,redhat: {
      contain avahi::service::redhat
    }
    debian,ubuntu: {
    }
  }

  service { 'avahi-daemon':
    enable => true,
    ensure => running,
  }
}
