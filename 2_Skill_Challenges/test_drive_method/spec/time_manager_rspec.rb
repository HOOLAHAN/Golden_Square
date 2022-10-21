# File: spec/time_manager_rspec.rb

require 'time_manager.rb'

describe 'read_time method' do
  it 'gives an estimate of read time of one word based on 200 words/minute' do
    result = read_time("test")
    expect(result).to eq "0 minutes : 0 seconds"
  end
  it 'gives an estimate of read time of 200 words based on 200 words/minute' do
    result = read_time("test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test 
test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test 
test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test 
test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test
test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test" )
    expect(result).to eq "1 minutes : 0 seconds"
  end
  it 'gives an estimate of read time of 300 words based on 200 words/minute' do
    result = read_time(
      "test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test" )
    expect(result).to eq "1 minutes : 30 seconds"
  end
end