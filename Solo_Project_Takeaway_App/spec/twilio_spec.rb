require 'twilio'
require 'json'

describe TwilioMessage do
  context 'when an order has been completed' do
    it 'sends a text to the phone number provided' do
      twilio = TwilioMessage.new
      expect(twilio.complete_order.to_s).to include "MessageInstance"
    end
  end
end
