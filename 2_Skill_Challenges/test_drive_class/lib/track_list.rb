# File: lib/track_list.md

class TrackList
  def initialize
    @track_list_array = []
    @remove_track = []
  end
  def add_track(track) 
    @track_list_array << track
  end
  def remove_track(track)
    if !@track_list_array.include? track
      return "Track not on list"
    else
    @track_list_array - (@remove_track << track)
    end
  end
  def show_list
    @track_list_array.empty? ? "List is empty" : @track_list_array
  end
end