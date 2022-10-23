require 'twilio'
require 'json'

describe TwilioMessage do
  context 'when an order has been completed' do
    it 'sends a text to the phone number provided' do
      fake_requester = double :requester 
      expect(fake_requester).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return('{"Twilio.Api.V2010.MessageInstance body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 20:16 num_segments: 1 direction: outbound-api from: +18583042972 to: +447545959137 date_updated: 2022-10-23 18:46:31 +0000 price:  error_message:  uri: /2010-04-01/Accounts/AC531c65983d8d705b1940ad18f841d522/Messages/SM6e5c678a7a4f8b591e4f89b538c8acb0.json account_sid: AC531c65983d8d705b1940ad18f841d522 num_media: 0 status: queued messaging_service_sid:  sid: SM6e5c678a7a4f8b591e4f89b538c8acb0 date_sent:  date_created: 2022-10-23 18:46:31 +0000 error_code:  price_unit: USD api_version: 2010-04-01 subresource_uris: {\"media" => "/2010-04-01/Accounts/AC531c65983d8d705b1940ad18f841d522/Messages/SM6e5c678a7a4f8b591e4f89b538c8acb0/Media.json"}')
      twilio = TwilioMessage.new(fake_requester)
      expect(twilio.complete_order).to eq "Twilio.Api.V2010.MessageInstance body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 20:16 num_segments: 1 direction: outbound-api from: +18583042972 to: +447545959137 date_updated: 2022-10-23 18:46:31 +0000 price:  error_message:  uri: /2010-04-01/Accounts/AC531c65983d8d705b1940ad18f841d522/Messages/SM6e5c678a7a4f8b591e4f89b538c8acb0.json account_sid: AC531c65983d8d705b1940ad18f841d522 num_media: 0 status: queued messaging_service_sid:  sid: SM6e5c678a7a4f8b591e4f89b538c8acb0 date_sent:  date_created: 2022-10-23 18:46:31 +0000 error_code:  price_unit: USD api_version: 2010-04-01 subresource_uris: {\"media" => "/2010-04-01/Accounts/AC531c65983d8d705b1940ad18f841d522/Messages/SM6e5c678a7a4f8b591e4f89b538c8acb0/Media.json"
    end
  end
end
