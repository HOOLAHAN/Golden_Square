# File: spec/grammar_help_rspec

require 'grammar_help.rb'
describe 'grammer_checker(text) method' do
  it 'verifies text string is incorrectly formatted' do
    result = grammar_checker("text")
    expect(result).to eq "Bad grammar!"
  end
  it 'verifies text string is correctly formatted' do
    result = grammar_checker("This sentence is ok.")
    expect(result).to eq "Good grammar!"
  end
  it 'provides error if argument is not a string' do
    result = grammar_checker(0)
    expect(result).to eq "Not a string"
  end
end