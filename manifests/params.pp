# == Class: zookeeper::params
#
# Default parameters for zookeeper class
#
class zookeeper::params {
  $id                     = 1
  $pkg_name               = 'zookeeper'
  $pkg_version            = '3.4.6'
  $url_site               = 'http://www.eu.apache.org'
  $extension              = 'tar.gz'
  $url                    = "${url_site}/dist/${pkg_name}/${pkg_name}-${pkg_version}/${pkg_name}-${pkg_version}.${extension}"
  $digest_string          = '971c379ba65714fd25dc5fe8f14e9ad1'
  $checksum               = true
  $digest_type            = 'md5'
  $follow_redirects       = true
  $group                  = 'zookeeper'
  $user                   = 'zookeeper'
  $manage_user            = true
  $installDir             = "/opt/${pkg_name}-${pkg_version}"
  $tmpDir                 = '/tmp'
  $jvmFlags               = '-Dzookeeper.log.threshold=INFO -Xmx1g'
  # TODO:
  #	?? keytab, kerberos
  #	log4j setup
#  Zookeeper configuration parameters
  $clientPortAddress      = '127.0.0.1'
  $cnxTimeout             = 20000
  $configDir              = '/etc/zookeeper'
  $dataDir                = '/var/lib/zookeeper'
  $dataLogDir             = '/var/log/zookeeper'
  $globalOutstandingLimit = 1000
  $maxClientCnxns         = 2000
  $purgeInterval          = 1
  $snapCount              = 100000
  $snapRetainCount        = 3
  $tickTime               = 60000
  $leaderServes           = 'yes'
  $servers                = { }
  $syncEnabled            = true
  $standaloneEnabled      = true
  $electionAlg            = 3
  $initLimit              = 5
  $syncLimit              = 5
  $clientPort             = 2181
  $leaderPort             = 3888
  $leaderElectionPort     = 2888
#  Zookeeper configuration parameters end
  $create_aio_service     = true
  $install_java           = true
  $java_package           = 'java-1.8.0-openjdk'
  $manage_firewall        = true
  $manage_service         = true
  $service_name           = 'zookeeper'
# Log4j configuration
  # $log4j_prop             = 'INFO,ROLLINGFILE'
  # $rollingfile_threshold  = 'ERROR'
  # $tracefile_threshold    = 'TRACE'

  case $::osfamily {
    'RedHat' : {
      if $::operatingsystemmajrelease == 7 {
        # firewalld, systemd, systemctl
        # classes: firewall2iptables, firewall
      } else {
      }
    }
    default: { fail("The ${::osfamily} operating system is not supported by the zookeeper module") }
  }
}
