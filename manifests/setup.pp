class piwam::setup {
  include piwam

  file { ["${::piwam::path}/config.ru"]:
    ensure => file,
    owner  => $::piwam::user,
    group  => $::piwam::group,
    mode   => '0444',
  }
  file { ["${::piwam::path}/log/production.log"]:
    ensure => file,
    owner  => $::piwam::user,
    group  => $::piwam::deploy_group,
    mode   => '0664',
  }
  file { ["${::piwam::path}/public", "${::piwam::path}/public/assets"]:
    ensure => directory,
    owner  => $::piwam::user,
    group  => $::piwam::group,
    mode   => '0755',
  }
  file { "${::piwam::path}/tmp":
    ensure => directory,
    owner  => $::piwam::user,
    group  => $::piwam::deploy_group,
    mode   => '0770',
  }
}
