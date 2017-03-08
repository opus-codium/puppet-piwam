class piwam::packages {
  include piwam

  ensure_packages(['libpq-dev', 'nodejs', 'nodejs-legacy'], {
    ensure => installed,
    before => Bundle::Install[$::piwam::path],
  })
}
