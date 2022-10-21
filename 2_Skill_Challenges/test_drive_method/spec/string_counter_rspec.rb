# File: string_counter_rspec.rb
 require 'string_counter.rb'

describe 'count_words method' do
  it 'takes a string as an argument and returns the number of words in that string.' do
    result = count_words("How many words are in this string?")
    expect(result).to eq 7
  end
end