class piwam::repo {
  include piwam

  file { $::piwam::path:
    ensure => directory,
    owner  => $::piwam::deploy_user,
    group  => $::piwam::deploy_group,
    mode   => '0755',
  }

  vcsrepo { $::piwam::path:
    ensure   => latest,
    provider => 'git',
    source   => 'https://github.com/haum/piwam.git',
    revision => 'accounts-display-incomes-expenses',
    user     => $::piwam::deploy_user,
    depth    => 1,
  }

  File[$::piwam::path]
  -> Vcsrepo[$::piwam::path]
}
