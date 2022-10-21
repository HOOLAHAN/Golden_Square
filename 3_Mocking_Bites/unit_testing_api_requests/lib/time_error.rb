# File: lib/time_error.rb

# To make this testable, you will need to create a double for Net:HTTP 
# and also deal with the behaviour of Time.now which is also non-deterministic.

require 'date'
require 'json'


class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer

  def initialize(requester)
    @requester = requester
  end

  def error(current_time)
    return get_server_time - current_time
  end

  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

