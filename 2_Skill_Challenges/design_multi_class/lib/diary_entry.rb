# File: lib/diary_entry.rb

class DiaryEntry

  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
  end

  def title
    return @title
    # Returns the title as a string
  end

  def contents
    return @contents
    # Returns the contents as a string
  end

  def count_words
    return 0 if contents.empty?
    return @contents.count(' ') + 1
    # Returns the number of words in the contents as an integer
  end
  
end