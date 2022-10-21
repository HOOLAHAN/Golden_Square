# File: spec/music_library_spec.rb

require 'music_library_spec'

describe MusicLibrary do
  it 'adds and lists tracks' do
    music_library = MusicLibrary.new
    track_1 = double :track
    track_2 = double :track
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq [track_1, track_2]
  end
  it 'searches tracks by title' do
    music_library = MusicLibrary.new
    track_1 = double :track, matches?: true
    track_2 = double :track, matches?: false
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.search("two")).to eq [track_1]
  end
end

