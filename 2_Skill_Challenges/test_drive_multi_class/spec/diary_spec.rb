# File: spec/diary_rspec.rb

require 'diary.rb'

RSpec.describe Diary do
  context 'initially' do
    it 'is empty' do
      entries = Diary.new
      expect(entries.all).to eq []
    end
    it 'has word count of 0' do
      entries = Diary.new
      expect(entries.count_words).to eq 0
    end
    it 'has reading time of 0' do
      entries = Diary.new
      expect { entries.reading_time(0) }.to raise_error "Reading speed must be above 0"
    end
    it 'has a best readable entry of nil' do
      entries = Diary.new
      expect(entries.find_best_entry_for_reading_time(2, 1)).to eq nil
    end
  end
end
