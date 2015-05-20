node buildserver{
  class { 'kibana':
    legacy_service_mode => true
  }

  class { 'logstash':
    manage_repo  => true,
  }
}

node production{
  class { 'logstash':
    manage_repo  => true,
  }
}
