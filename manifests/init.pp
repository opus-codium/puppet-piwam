class piwam (
  $path,
  $servername,
  $secret_key_base,
  $database_host,
  $database_name,
  $database_user ,
  $database_password,
  $user = 'piwam',
  $group = 'piwam',
  $deploy_user = 'oneshot',
  $deploy_group = 'oneshot',
  $ssl_cert,
  $ssl_key,
  $ssl_chain,
) {
  include bundle

  include piwam::packages
  include piwam::user
  include piwam::repo
  include piwam::setup
  include piwam::db
  include piwam::bundle
  include piwam::migrate
  include piwam::assets
  include piwam::vhost

  Class['piwam::packages'] ->
  Class['piwam::user'] ->
  Class['piwam::repo'] ->
  Class['piwam::setup'] ->
  Class['piwam::db'] ->
  Class['piwam::bundle'] ->
  Class['piwam::migrate'] ->
  Class['piwam::assets'] ->
  Class['piwam::vhost']

  Class['piwam::repo'] ~>
  Class['piwam::bundle'] ~>
  Class['piwam::migrate']

  Class['piwam::db'] ~>
  Class['piwam::migrate'] ~>
  Service['httpd']

  Class['piwam::repo'] ~>
  Class['piwam::setup'] ~>
  Class['piwam::assets']
}
