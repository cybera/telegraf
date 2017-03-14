# == Class: telegraf::service
#
# Optionally manage the Telegraf service.
#
class telegraf::service {

  assert_private()
  if ($::telegraf::service_disable) {
          $service_ensure = 'stopped',
          $service_enable = false
      } else {
          $service_ensure = 'running',
          $service_enable = true
      }

  if $::telegraf::manage_service {
    service { 'telegraf':
      ensure => $service_ensure,
      hasstatus => $telegraf::service_hasstatus,
      enable    => $service_enable,
      restart   => $telegraf::service_restart,
      require   => Class['::telegraf::config'],
    }
  }
}
