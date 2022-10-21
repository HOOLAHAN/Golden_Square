# File: spec/diary_entry_rspec.rb

require 'diary_entry.rb'

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

describe 'reading_time method' do
  it 'Returns an integer representing an estimate of the reading time in minutes for the contents at the given wpm' do
    entry = DiaryEntry.new("title1", "Here is some content")
    expect(entry.reading_time(2)).to eq 2
  end
  it 'Returns an integer representing an estimate of the reading time in minutes for the contents at the given wpm' do
    entry = DiaryEntry.new("title1", "Here is some content")
    expect(entry.reading_time(3)).to eq 2
  end
  it 'fails when wpm is not a positive number' do
    entry = DiaryEntry.new("title1", "Here is some content")
    expect { entry.reading_time(0) } .to raise_error "Reading speed must be above 0"
  end
end

describe 'reading_chunk method' do
  it 'Returns a string with a chunk of the contents that the user could read in the given number of minutes.' do
    entry = DiaryEntry.new("title1", "Here is some lengthy albeit pretty good content")
    expect(entry.reading_chunk(3, 2)).to eq "Here is some lengthy albeit pretty"
  end
  it 'If called again, `reading_chunk` should return the next chunk, skipping what has already been read, until the contents is fully read.' do
    entry = DiaryEntry.new("title1", "Here is some lengthy albeit pretty good content")
    entry.reading_chunk(3, 2)
    expect(entry.reading_chunk(3, 2)).to eq "good content"
  end
  it 'The next call after that it should restart from the beginning' do
    entry = DiaryEntry.new("title1", "Here is some lengthy albeit pretty good content")
    entry.reading_chunk(3, 2)
    entry.reading_chunk(3, 2)
    expect(entry.reading_chunk(3, 2)).to eq "Here is some lengthy albeit pretty"
  end
  it "restarts after finishing exactly on the end of contents" do
    diary_entry = DiaryEntry.new("title1", "one two three four")
    diary_entry.reading_chunk(2, 1)
    diary_entry.reading_chunk(2, 1)
    chunk = diary_entry.reading_chunk(2, 1)
    expect(chunk).to eq "one two"
  end
  context 'when a non positive wpm is entered' do
    it 'fails' do
      entry = DiaryEntry.new("title1", "Here is some content")
      expect { entry.reading_chunk(0, 1)}.to raise_error "Reading speed must be above 0"
    end
  end
end