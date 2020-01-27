# This class ensures the service is running.

if $journald::service_manage == true {
  class journald::service {
    service { 'systemd-journald':
      ensure     => $journald::service_ensure,
      enable     => $journald::service_enable,
      hasrestart => true,
      hasstatus  => true,
    }
  }
}
