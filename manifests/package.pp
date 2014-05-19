class avahi::package() {

  case $::operatingsystem {
    centos,fedora,rhel,redhat: {
      contain avahi::package::redhat
    }
    debian,ubuntu: {
      contain avahi::package::debian
    }
  }
}
