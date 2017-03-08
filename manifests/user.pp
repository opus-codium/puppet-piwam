class piwam::user {
  include piwam

  user { $::piwam::user:
    ensure => present,
    home   => $::piwam::path,
    system => true,
  }
}
