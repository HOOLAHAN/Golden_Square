# File: spec/secret_diary_spec.rb

describe SecretDiary do
  context 'initially' do
    it 'it does not return the diary as the contents is locked' do
      fake_diary = double :fake_diary
      secret_diary = SecretDiary.new(fake_diary)
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end
  context 'when the diary is unlocked' do
    it 'returns the contents of the diary' do
      fake_diary = double :fake_diary, read: "one two three"
      reader = SecretDiary.new(fake_diary)
      reader.unlock
      expect(reader.read).to eq "one two three"
    end
  end
  context 'when locked' do
    it 'doesnt read the diary' do
      fake_diary = double :fake_diary
      reader = SecretDiary.new(fake_diary)
      reader.unlock
      reader.lock
      expect { reader.read }.to raise_error "Go away!"
    end
  end
end