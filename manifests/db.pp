class piwam::db {
  include piwam

  include postgresql::server

  file { ["${::piwam::path}/config/database.yml"]:
    ensure  => file,
    owner   => $::piwam::deploy_user,
    group   => $::piwam::group,
    mode    => '0440',
    content => template('piwam/database.yml.erb')
  }
  postgresql::server::db { $::piwam::database_name:
    user     => $::piwam::database_user,
    password => postgresql_password($::piwam::database_user, $::piwam::database_password),
  }
}
