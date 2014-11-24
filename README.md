[![Build Status](https://travis-ci.org/yuku-t/guard-webhook-notifier.svg?branch=master)](https://travis-ci.org/yuku-t/guard-webhook-notifier)

# NAME

`GuardWebHookNotifier` - Notify Guard Events by HTTP POST Requests.

# SYNOPSIS

```rb
# Guardfile

require 'guard-webhook-notifier'
GuardWebHookNotifier.register

guard 'rspec' do
  watch(%r{spec/.+_spec\.rb$})
  notification :webhook, url: 'http://10.0.2.2:4001'
end
```

## Server Example

```rb
# Running on OS X machine.

require 'listen'
require 'terminal-notifier'
require 'json'
require 'webrick'

# Forwarding events to Vagrant over TCP.
listener = Listen.to './', forward_to: '127.0.0.1:4000'

# HTTP server.
server = WEBrick::HTTPServer.new(Port: 4001)

# Handle POST requests sent from guard-webhook-notifier in Vagrant.
class TerminalNotifierServlet < 
  def do_POST(req, res)
    json = JSON.parse(req.body)
    message = json['message']
    opts = json['options']
    # Show notification.
    TerminalNotifier.notify(message, title: opts['title'])
    res.status = 200
  end
end
server.mount('/', TerminalNotifierServlet)

trap 'INT' do
  listener.stop
  server.shutdown
end

listener.start
server.start
```

# INSTALLATION

```bash
gem install guard-webhook-notifier
```

# LICENSE

This software is licensed under [MIT license](https://github.com/yuku-t/guard-webhook-notifier/tree/master/LICENSE.txt).
