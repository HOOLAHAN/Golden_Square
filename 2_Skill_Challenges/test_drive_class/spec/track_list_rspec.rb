# File: spec/track_list_rspec.md

require 'track_list.rb'

describe 'add_track method' do
  it 'adds track to a list' do
    track = TrackList.new
    result = track.add_track("Song 1")
    expect(result).to eq ["Song 1"]
  end
  it 'adds track to a list' do
    track = TrackList.new
    track.add_track("Song 1")
    result = track.add_track("Song 2")
    expect(result).to eq ["Song 1", "Song 2"]
  end
end

describe 'remove_track method' do
  it 'removes a track from the list' do
      track = TrackList.new
      track.add_track("Song 1")
      track.add_track("Song 2")
      result = track.remove_track("Song 1")
      expect(result).to eq ["Song 2"]
  end
  it 'displays message if song is not on the list' do
    track = TrackList.new
    track.add_track("Song 1")
    result = track.remove_track("Song 2")
    expect(result).to eq "Track not on list"
  end
end

describe 'show_list method' do
  it 'returns the list' do
      track = TrackList.new
      track.add_track("Song 1")
      track.add_track("Song 2")
      result = track.show_list
      expect(result).to eq ["Song 1", "Song 2"]
  end
  it 'displays message if list is empty when called' do
    track = TrackList.new
    result = track.show_list
    expect(result).to eq "List is empty"
  end
end