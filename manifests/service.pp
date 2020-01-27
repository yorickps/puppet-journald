# @summary Manage the `journald` service

class journald::service {

if $journald::service_manage == true {
    service { 'systemd-journald':
      ensure     => $journald::service_ensure,
      enable     => $journald::service_enable,
      hasrestart => true,
      hasstatus  => true,
    }
  }
}
