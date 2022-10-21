# File: spec/diary_entry_rspec.rb

require 'diary_entry.rb'

RSpec.describe DiaryEntry do
  it 'constructs' do
    diary_entry = DiaryEntry.new("some_title", "some_contents")
    expect(diary_entry.title).to eq "some_title"
    expect(diary_entry.contents).to eq "some_contents"
  end
  
  describe "count_words" do
    it 'returns the number of words in the contents' do
      diary_entry = DiaryEntry.new("some_title", "some contents here")
      expect(diary_entry.count_words).to eq 3
    end
    it 'returns zero when contents is empty' do
      diary_entry = DiaryEntry.new("some_title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  describe "reading_time" do
    context 'given a sensible wpm' do
      it 'Returns an integer representing an estimate of the reading time in minutes' do
        diary_entry = DiaryEntry.new("some_title", "one two three")
        expect(diary_entry.reading_time(3)).to eq 1
      end
    end
    context 'given a wpm of 0'do
      it 'fails' do
        diary_entry = DiaryEntry.new("some_title", "some_text")
        expect {diary_entry.reading_time(0)}.to raise_error "Reading speed must be above 0"
      end
    end
  end

  describe "reading_chunk" do
    context "with a contents readable within the given minutes" do
      it 'Returns a string with a chunk of the contents that the user could read in the given number of minutes.' do
        diary_entry = DiaryEntry.new("some_title", "one two three")
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end
      it "returns the next chunk next time we are asked" do
        diary_entry = DiaryEntry.new("some_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "three"        
      end
      it "restarts after finishing contents" do
        diary_entry = DiaryEntry.new("some_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end
      it "restarts after finishing exactly on the end of contents" do
        diary_entry = DiaryEntry.new("some_title", "one two three four")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end   
      context 'given a wpm of 0'do
        it 'fails' do
          diary_entry = DiaryEntry.new("some_title", "some_text")
          expect {diary_entry.reading_chunk(0, 1)}.to raise_error "Reading speed must be above 0"
        end
      end 
    end
  end

end