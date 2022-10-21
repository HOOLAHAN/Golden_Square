# File: spec/diary_integration_spec.rb

require 'diary'
require 'diary_entry'

describe 'integration' do
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

describe 'readable entries behaviour' do
  context 'given a speed and time ' do
    it 'provides a list of diary entries readable' do
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "one two")
      entry2 = DiaryEntry.new("title2", "one two three")
      entry3 = DiaryEntry.new("title2", "one two three four")
      journal.add(entry1)
      journal.add(entry2)
      journal.add(entry3)
      expect(journal.readable_entries(3, 1)).to eq [entry1, entry2]
    end
    it 'returns an empty list when no entries are readbale within the timeframe' do
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "one two")
      entry2 = DiaryEntry.new("title2", "one two three")
      journal.add(entry1)
      journal.add(entry2)
      expect(journal.readable_entries(1, 1)).to eq []
    end
  end
end

describe 'find_contacts behaviour' do
  context 'given a list of diary entries' do
    it 'provides a list of phone numbers' do
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "one two")
      entry2 = DiaryEntry.new("title2", "one two three")
      entry3 = DiaryEntry.new("title2", "one two three four")
      entry4 = DiaryEntry.new("title1", "one 07849378136 two")
      entry5 = DiaryEntry.new("title2", "one two three 07781368493")
      entry6 = DiaryEntry.new("title2", "one two three four")
      journal.add(entry1)
      journal.add(entry2)
      journal.add(entry3)
      journal.add(entry4)
      journal.add(entry5)
      journal.add(entry6)
      expect(journal.find_contacts).to eq ["07849378136", "07781368493"]
    end
    it 'works when more than one phone number is in the same entry' do
      journal = Diary.new
      entry1 = DiaryEntry.new("title1", "one two")
      entry2 = DiaryEntry.new("title2", "one two three")
      entry3 = DiaryEntry.new("title2", "one two three four")
      entry4 = DiaryEntry.new("title1", "one 07849378136 two")
      entry5 = DiaryEntry.new("title2", "one two three 07781368493")
      entry6 = DiaryEntry.new("title2", "one two 07849378136 three 07781368493 four")
      journal.add(entry1)
      journal.add(entry2)
      journal.add(entry3)
      journal.add(entry4)
      journal.add(entry5)
      journal.add(entry6)
      expect(journal.find_contacts).to eq ["07849378136", "07781368493", "07849378136", "07781368493"]
    end  
  end
end