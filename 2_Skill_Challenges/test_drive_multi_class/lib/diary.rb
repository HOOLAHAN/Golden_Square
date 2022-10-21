# File: lib/diary.rb
class Diary
  def initialize
    @entries = []
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

  def count_words
    return @entries.map do |words| 
      words.count_words
    end.sum
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
  end

  def reading_time(wpm)
    fail "Reading speed must be above 0" unless wpm > 0
    return (count_words.to_f / wpm).ceil
    # wpm is an integer representing the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    return readable_entries(wpm, minutes).max_by(&:count_words)
    # `wpm` is an integer representing the number of words the user can read per minute.
    # `minutes` is an integer representing the number of minutes the user has to read.
    # Returns an instance of diary entry representing the entry that is closest to, but not over, the length that the user could read in the minutes they have available given their reading speed.
  end

  private
  
  def readable_entries(wpm, minutes)
    return readable_entries = @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end
end