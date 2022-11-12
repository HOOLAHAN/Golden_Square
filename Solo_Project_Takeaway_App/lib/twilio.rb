require 'twilio-ruby'
require 'rubygems'

class TwilioMessage

  def send_text(text_message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['TWILIO_NUMBER']
    mobile_number = ENV['IH_MOBILE']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
    body: "#{text_message}",
    from: "#{twilio_number}",
    to: "#{mobile_number}"
    )
  end

  def complete_order
    time = (Time.new + 30*60).strftime("%k:%M") # adds 30 mins to current time
    text_message = "Thank you! Your order was placed and will be delivered before #{time}"
    return send_text(text_message)
  end

end


# Usage
# =========================
# message = TwilioMessage.new(Twilio::REST::Client)
# message.complete_order