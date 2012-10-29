# Start avahi services for mdns

class avahi($firewall=false) {
  
  $packages = ['avahi', 'avahi-autoipd', 'avahi-compat-libdns_sd', 'avahi-glib', 'avahi-gobject', 'avahi-tools', 'nss-mdns']
  
  package { $packages:
    ensure => present,
    before => [Service['messagebus'],Service['avahi-daemon']],
  }
 
  service { 'messagebus':
    enable => true,
    ensure => running,
  } ~>
  service { 'avahi-daemon':
    enable => true,
    ensure => running,
  }

  if $firewall {

    # iptables -A INPUT -p udp --dport 5353 -d 224.0.0.251 -j ACCEPT
    # iptables -A OUTPUT -p udp --dport 5353 -d 224.0.0.251 -j ACCEPT

    firewall { '100 allow avahi':
      chain       => ['INPUT', 'OUTPUT'],
      proto       => 'udp',
      dport       => '5353',
      destination => '224.0.0.251',
      action      => 'accept',
    }
  }
}
