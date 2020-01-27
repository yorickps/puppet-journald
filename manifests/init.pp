# @summary Manage the `journald` daemon
#
# @param persist_log
#  By default, the journal stores log data in /run/log/journal/.
#  Since /run/ is volatile, log data is lost at reboot. To make the
#  data persistent, it is sufficient to create /var/log/journal/
#  where systemd-journald will then store the data.
#
# @param options
#   A hash with journald parameters
#
class journald (
  # Module data
  Boolean $persist_log,
  Boolean $service_enable,
  Boolean $service_manage,
  Hash    $options,
  Enum['running', 'stopped'] $service_ensure,
) {

  contain ::journald::config
  contain ::journald::service

  Class['journald::config'] ~> Class['journald::service']

}
