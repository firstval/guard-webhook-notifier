require "faraday"
require "guard/notifiers/base"
require "json"

module GuardWebHookNotifier
  class Notifier < Guard::Notifier::Base
    DEFAULTS = {
      user_agent: "GuardWebHookNotifier/#{VERSION}",
      url: "http://10.0.2.2:4001/"
    }

    def initialize(opts = {})
      super
      @options = DEFAULTS.merge(opts)
    end

    def notify(message, opts = {})
      super
      send(message, opts) rescue Faraday::Error
    end

    private

    def send(message, opts)
      conn = Faraday.new(url: opts[:url])
      conn.post do |req|
        req.headers["Content-Type"] = "application/json"
        req.headers["User-Agent"] = opts[:user_agent]
        req.body = { message: message, options: opts }.to_json
      end
    end
  end
end
