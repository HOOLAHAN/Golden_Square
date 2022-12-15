# File: spec/diary_integration_rspec.rb

require 'diary.rb'
require 'diary_entry.rb'

RSpec.describe 'integration' do
  context 'when an entry is added to diary_entry it is returned in diary' do
    it 'is returned in the list' do
    journal = Diary.new
    entry = DiaryEntry.new("title1", "contents1")
    journal.add(entry)
    expect(journal.all).to eq [entry]
    end
  end
  context 'when more than one entry is added' do
    it 'returns more than one entry in the list' do
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "contents1")
      entry2 = DiaryEntry.new("title2", "contents2")
      journal.add(entry1)
      journal.add(entry2)
      expect(journal.all).to eq [entry1, entry2]
    end  
  end
end

RSpec.describe 'word counting behaviour' do
  context 'with some entries added' do
    it 'counts the words in all diary entries' do
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "Here is some content")
      entry2 = DiaryEntry.new("title2", "Here is some more content")
      journal.add(entry1)
      journal.add(entry2)
      expect(journal.count_words).to eq 9
    end
  end
  context 'with a word count of zero' do
    it 'returns zero' do
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "")
      entry2 = DiaryEntry.new("title2", "")
      journal.add(entry1)
      journal.add(entry2)
      expect(journal.count_words).to eq 0
    end
  end
end

RSpec.describe 'read time behaviour' do
  it 'Returns an integer representing an estimate of the reading time in minutes if the user were to read all entries in the diary' do
    journal = Diary.new
    entry1 = DiaryEntry.new("title1", "Here is some good content")
    entry2 = DiaryEntry.new("title2", "Here is some more content")
    journal.add(entry1)
    journal.add(entry2)
    expect(journal.reading_time(2)).to eq 5
  end
  it 'rounds up when there is a remainder' do
    journal = Diary.new
    entry1 = DiaryEntry.new("title1", "Here is some good content")
    entry2 = DiaryEntry.new("title2", "Here is some more content")
    journal.add(entry1)
    journal.add(entry2)
    expect(journal.reading_time(4)).to eq 3
  end
  it 'throws error when wpm is not a positive number' do
    journal = Diary.new
    entry1 = DiaryEntry.new("title1", "Here is some good content")
    entry2 = DiaryEntry.new("title2", "Here is some more content")
    journal.add(entry1)
    journal.add(entry2)
    expect { journal.reading_time(0)}.to raise_error "Reading speed must be above 0"
  end
end

RSpec.describe 'find_best_entry_for_reading_time behaviour' do
  context 'where we just have one entry and it is readable in the time' do
    it 'returns the entry' do
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "Here is some content")
      journal.add(entry1)
      expect(journal.find_best_entry_for_reading_time(4, 1)).to eq entry1
    end
  end
  context 'where we just have one entry and it is not readable in the time' do
    it 'returns the entry' do
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "Here is some content")
      journal.add(entry1)
      expect(journal.find_best_entry_for_reading_time(2, 1)).to eq nil
    end
  end
  context 'where we have more than one entry' do
    it 'Returns an instance of diary entry representing the entry that is closest to, but not over, the length that the user could read in the minutes they have available given their reading speed.' do    journal = Diary.new
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "Here is some lengthy albeit pretty good content")
      entry2 = DiaryEntry.new("title1", "Here is some lengthy albeit good content")
      entry3 = DiaryEntry.new("title3", "Here is some content")
      best_entry = DiaryEntry.new("title2", "Here is some more suitable content")
      journal.add(entry1)
      journal.add(entry2)
      journal.add(entry3)
      journal.add(best_entry)
      expect(journal.find_best_entry_for_reading_time(2, 3)).to eq best_entry
    end
  end
end

