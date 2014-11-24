require "spec_helper"

describe GuardWebHookNotifier do
  it { expect(described_class).to respond_to(:register) }
end
