class piwam::bundle {
  include piwam

  bundle::install { $piwam::path:
    user    => $::piwam::deploy_user,
    timeout => '600',
  }
}
