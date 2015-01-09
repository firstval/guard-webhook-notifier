require "notiffany/notifier"

module GuardWebHookNotifier
  require "guard-webhook-notifier/version"
  require "guard-webhook-notifier/notifier"

  def register(name = 'webhook')
    Notiffany::Notifier::SUPPORTED << { name => Notifier }
  end

  module_function :register
end
