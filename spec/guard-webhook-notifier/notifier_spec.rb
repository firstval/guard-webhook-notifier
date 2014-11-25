require "spec_helper"

describe GuardWebHookNotifier::Notifier do
  it { should be_a(Guard::Notifier::Base) }

  describe "#notify" do
    subject do
      notifier.notify(message)
    end

    let(:notifier) do
      described_class.new(url: "http://10.0.2.2:4001")
    end

    let(:message) do
      "message"
    end

    it 'sends a POST request with given message' do
      stub = stub_request(:post, '10.0.2.2:4001').with(
        body: /"message":"#{message}"/,
        headers: {
          "Content-Type" => "application/json",
          "User-Agent" => "GuardWebHookNotifier/#{GuardWebHookNotifier::VERSION}"
        }
      )
      subject
      expect(stub).to have_been_requested.once
    end

    context 'when timeout occurs' do
      before do
        stub_request(:post, '10.0.2.2:4001').to_timeout
      end

      it { expect { subject }.not_to raise_error }
    end
  end
end
