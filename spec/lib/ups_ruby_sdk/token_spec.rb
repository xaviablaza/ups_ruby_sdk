require "spec_helper"

RSpec.describe UpsRubySdk::Token do
  describe '.create' do
    before do
      UpsRubySdk.configure do |c|
        c.client_id = CONFIG[:client_id]
        c.client_secret = CONFIG[:client_secret]
      end
    end
    it "returns a Token object", vcr: { record: :once, match_requests_on: %i[method] } do
      client = UpsRubySdk::Client.new(test: true)
      token = described_class.create(client: client)
      expect(token).to be_a(UpsRubySdk::Token)
    end
  end
end
