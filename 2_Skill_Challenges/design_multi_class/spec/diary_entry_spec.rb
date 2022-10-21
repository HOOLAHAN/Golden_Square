# File: spec/diary_entry_spec.rb

require 'diary_entry'

describe DiaryEntry do 
  context 'when initialised' do
    it 'constructs' do
      entry = DiaryEntry.new("title1", "contents1")
      expect(entry.title).to eq "title1"
      expect(entry.contents).to eq "contents1"
    end
  end
  context 'when entries are added' do
    it 'counts the number of words of the contents' do
      entry = DiaryEntry.new("title1", "Here is some content")
      expect(entry.count_words).to eq 4
    end
  end
  context 'when contents is empty' do
    it 'returns zero' do
      entry = DiaryEntry.new("title1", "")
      expect(entry.count_words).to eq 0
    end
  end
end