node buildserver{
  class { 'kibana': }
  class { 'logstash': }
}

node production{
  class { 'logstash': }
}
