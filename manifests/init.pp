class nessus::server {

  service {
    "nessusd":
      enable => true,
      ensure => running,
      require => Package[Nessus];
    "iptables" :
      ensure => stopped,
      enable => false,
      hasrestart => true,
      hasstatus => true,
      status => "/sbin/iptables -L | /bin/grep -q DROP";
   }

  package {
    Nessus :
      ensure => installed;
  }

  file {
    "/etc/cron.d/nessus-clean" :
      source => "puppet:///modules/nessus/nessus-clean.cron",
      mode => 0440,
      owner => "root",
      group => "root";
    "/opt/nessus/com/nessus/CA/servercert.pem" :
      source => "puppet:///modules/nessus/ssl/servercert.pem-$fqdn",
      mode => 0660,
      owner => "root",
      group => "root";
    "/opt/nessus/var/nessus/CA/serverkey.pem" :
      source => "puppet:///modules/nessus/ssl/serverkey.pem-$fqdn",
      mode => 0660,
      owner => "root",
      group => "root";
    #"/opt/nessus/lib/nessus/plugins/custom_CA.inc" :
    #  source => "puppet:///modules/nessus/custom_CA.inc",
    #  mode => 0644,
    #  owner => "root",
    #  group => "root";
  }
}
