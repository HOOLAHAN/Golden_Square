# File: spec/diary_secret_diary_integration_spec.rb

require 'secret_diary'
require 'diary'

describe 'integration' do
  context 'initially' do    
    it 'it does not return the diary as the contents is locked' do
      diary = Diary.new("one two three")
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end
  context 'when the diary is unlocked' do    
    it 'returns the diarys contents' do
      diary = Diary.new("one two three")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "one two three"
    end
  end
  context 'when it is relocked' do
    it 'does not read the diary' do
      diary = Diary.new("one two three")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end
end