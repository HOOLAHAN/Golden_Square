# File: spec/diary_spec.rb

require 'diary'

describe Diary do
  context 'initially' do
    it 'is empty' do
      entries = Diary.new
      expect(entries.all).to eq []
    end
  end
end