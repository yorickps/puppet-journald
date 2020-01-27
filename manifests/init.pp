# @summary Manage the `journald` daemon
#
# @param Boolean persist_log # By default, the journal stores log data in /run/log/journal/.
#  Since /run/ is volatile, log data is lost at reboot. To make the
#  data persistent, it is sufficient to create /var/log/journal/
#  where systemd-journald will then store the data.
# @param Boolean service_enable # Enable or disable systemd journald service
# @param Boolean service_manage # Manage the journald service or not
# @param Hash options # A hash with journald parameters
# @param Enum service_ensure # Set the journald service state - stopped or running
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
