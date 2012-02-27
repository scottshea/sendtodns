#!/usr/bin/env ruby
require "./lib/send_to_dns"
require "logging"
require "resque"
require "parallel"

Logging.color_scheme( 'bright',
  :levels => {
    :info  => :green,
    :warn  => :yellow,
    :error => :red,
    :fatal => [:white, :on_red]
  },
  :date => :blue,
  :logger => :cyan,
  :message => :magenta
)

Logging.appenders.stdout(
  'stdout',
  :layout => Logging.layouts.pattern(
    :pattern => '[%d] %-5l %c:%M %m\n',
    :color_scheme => 'bright'
  )
)

nameserver = "ns1.sendtodns.org"
domain = "sendtodns.org"
key = "./keys/private"
file = "file.img"
foo = PushFile.new(domain, nameserver, key, file)


