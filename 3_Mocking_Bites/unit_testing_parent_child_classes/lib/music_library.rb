# File: lib/music_library.rb

class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track) 
    @tracks << track
    # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
  end

  def all
    return @tracks
    # Returns a list of track objects
  end
  
  def search(keyword) 
    return @tracks.select do |track|
      track.matches?(keyword)
    end
    # keyword is a string
    # Returns a list of tracks that match the keyword
  end
end