# File: spec/grammar_stats_challenge_rspec.rb

require 'grammar_stats_challenge.rb'

describe 'check(text) method' do
  context 'when string has good punctuation' do
    it 'returns true' do
    added_text = GrammarStats.new
    expect(added_text.check("Hello world!")).to eq true
    end
  end
  context 'when string has bad punctuation' do
    it 'returns false' do
    added_text = GrammarStats.new
    expect(added_text.check("hello world")).to eq false
    end
  end
  context 'when text input is not a string' do
    it 'returns not a string message' do
    added_text = GrammarStats.new
    expect(added_text.check(123)).to eq "Not a string"
    end
  end 
end

describe 'percentage_good method' do
  context 'returns integer representing percentage of checks passed so far' do
    it 'returns integer' do
      added_text = GrammarStats.new
      added_text.check("Hello world!")
      expect(added_text.percentage_good).to eq 100
      added_text.check("hello world")
      expect(added_text.percentage_good).to eq 50
      added_text.check("Hello world.")
      expect(added_text.percentage_good).to eq 66
    end
  end
end