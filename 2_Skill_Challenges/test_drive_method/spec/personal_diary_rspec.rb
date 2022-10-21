# File: spec/personal_diary_rspec.rb

require 'personal_diary.rb'

describe 'make_snippet method' do
  it 'returns first five words + "..."' do
    result = make_snippet("On the first day of Christmas")
    expect(result).to eq "On the first day of ..."
  end
end