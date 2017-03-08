class piwam::assets {
  include piwam

  bundle::exec { 'piwam assets:precompile':
    cwd         => $::piwam::path,
    command     => 'rake assets:precompile',
    user        => $::piwam::user,
    group       => $::piwam::group,
    timeout     => 600,
    environment => ['RAILS_ENV=production'],
    refreshonly => true,
  }
}
