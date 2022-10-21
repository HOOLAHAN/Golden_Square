# File: spec/diary_spec.rb

describe Diary do
  it 'sets contents and reads' do
    diary = Diary.new("one two three")
    expect(diary.read).to eq "one two three"
  end
end

