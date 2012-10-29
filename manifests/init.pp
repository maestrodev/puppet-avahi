class avahi {
  
  $packages = ["avahi", "avahi-autoipd", "avahi-compat-libdns_sd", "avahi-glib", "avahi-gobject", "avahi-tools", "nss-mdns"]
  
  package { $packages:
    ensure => present,
    before => Service["avahi-daemon"],
  } 
 
  service { "avahi-daemon":
    hasstatus => true,
    hasrestart => true,
    ensure => running,
  }
  
}
