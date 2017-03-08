class piwam::migrate {
  include piwam

  bundle::exec { 'piwam db:migrate':
    cwd         => $::piwam::path,
    command     => 'rake db:migrate',
    user        => $::piwam::user,
    group       => $::piwam::group,
    timeout     => 600,
    environment => ['RAILS_ENV=production', 'LANG=fr_FR.UTF-8'],
    refreshonly => true,
  }

  file { "${::piwam::path}/db/schema.rb":
    ensure => file,
    owner  => $::piwam::user,
    group  => $::piwam::group,
    mode   => '0644',
  }

  Bundle::Exec['piwam db:migrate'] ->
  File["${::piwam::path}/db/schema.rb"]
}
