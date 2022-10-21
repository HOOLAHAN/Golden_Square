# File: spec/integration_tests_spec.rb

require 'music_library'
require 'track'

describe 'integration' do
  it 'adds and lists tracks' do
    music_library = MusicLibrary.new
    track_1 = Track.new("track1", "artist1")
    track_2 = Track.new("track2", "artist2")
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq [track_1, track_2]
  end
  it 'searches tracks by title' do
    music_library = MusicLibrary.new
    track_1 = Track.new("one two three", "four five six")
    track_2 = Track.new("seven eight nine", "ten eleven twelve")
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.search("two")).to eq [track_1]
  end
end