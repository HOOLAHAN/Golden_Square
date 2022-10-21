# File: spec/track_spec.rb

require 'track'

describe Track do
  it 'returns true if the keyword matches either the title or artist' do
  track = Track.new("title1 MATCH", "artist1")
  expect(track.matches?("MATCH")).to eq true
  end
  it 'returns true if the keyword matches either the title or artist' do
    track = Track.new("title1", "artist1 MATCH")
    expect(track.matches?("MATCH")).to eq true
  end
  it 'returns false if the keyword matches neither the title or artist' do
    track = Track.new("title1", "artist1")
    expect(track.matches?("MATCH")).to eq false
    end
  it 'returns fasle if the keyword matches neither the title or artist' do
    track = Track.new("title1", "artist1")
    expect(track.matches?("MATCH")).to eq false
  end
end
