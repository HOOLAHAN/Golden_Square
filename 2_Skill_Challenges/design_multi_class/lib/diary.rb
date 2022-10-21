# File: lib/diary.rb

class Diary

  def initialize
    @entries = []
    @readable_array = []
    @contacts_list = []
  end

  def add(entry) 
    @entries << entry
    # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    return @entries
    # Returns a list of instances of DiaryEntry
  end

  def readable_entries(wpm, minutes)
    @entries.each do |words|
      if words.count_words <= wpm * minutes
        @readable_array << words
      end
    end
    return @readable_array
    # Returns all instances which the user could read in the 
    # minutes they have available given their reading speed.
  end

  def find_contacts
    @contacts_list = @entries.flat_map {|a| a.contents.scan(/07[0-9]{9}/)}
  end
  
  def show_contacts
    return @contacts_list
  end

end