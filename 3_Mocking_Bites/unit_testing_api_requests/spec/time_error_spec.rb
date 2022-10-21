# File: spec/time_error_spec.rb
require 'net/http'
require 'time_error'

describe TimeError do
  it 'calls an API to return the time difference in seconds between the server time and this computer' do
    fake_requester_dbl = double :requester
    expect(fake_requester_dbl).to receive(:get)
      .with(URI("https://worldtimeapi.org/api/ip"))
      .and_return('{"abbreviation":"BST","client_ip":"2a01:70:f00:1:f88f:a84:f603:51b","datetime":"2022-10-20T16:31:03.073454+01:00","day_of_week":4,"day_of_year":293,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1666279863,"utc_datetime":"2022-10-20T15:31:03.073454+00:00","utc_offset":"+01:00","week_number":42}')
      time = Time.new(2022, 10, 20, 16, 31, 03)
      time_error = TimeError.new(fake_requester_dbl)
      expect(time_error.error(time)).to eq 0.073454
  end
end