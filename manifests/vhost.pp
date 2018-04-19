class piwam::vhost {
  include piwam

  include apache
  include apache::mod::passenger
  apache::vhost { $::piwam::servername:
    port           => 443,
    ssl            => true,
    ssl_cert       => $::piwam::ssl_cert,
    ssl_key        => $::piwam::ssl_key,
    ssl_chain      => $::piwam::ssl_chain,
    manage_docroot => false,
    docroot        => "${::piwam::path}/public",
    default_vhost  => true,
    setenv         => [
      "SECRET_KEY_BASE ${::piwam::secret_key_base}",
    ],
    directories    => [
      { 'path'         => "${::piwam::path}/public",
        options        => 'None',
        allow_override => 'None',
      },
    ],
  }
}
