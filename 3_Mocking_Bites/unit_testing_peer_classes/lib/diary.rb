# File: lib/diary.rb

class Diary
  def initialize(contents) # contents is a string
    @contents = contents 
  end

  def read
    return @contents
    # Returns the contents of the diary
  end
end