# File: spec/to_do_list_rspec.rb

require 'to_do_list.rb'

describe 'to_do_check method' do
  it 'checks if text contains #TODO' do
    result = to_do_check("test")
    expect(result).to eq false
  end
  it 'checks if text contains #TODO' do
    result = to_do_check("#TODO test")
    expect(result).to eq true
  end
  it 'checks if text contains #TODO' do
  result = to_do_check(200)
  expect(result).to eq false
end
end