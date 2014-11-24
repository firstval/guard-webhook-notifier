require "guard/notifier"

module GuardWebHookNotifier
  require "guard-webhook-notifier/version"
  require "guard-webhook-notifier/notifier"

  def register(name = 'webhook')
    Guard::Notifier::NOTIFIERS << { name => Notifier }
  end
end
