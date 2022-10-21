# File: lib/time_manager.rb

def read_time(text)
  words_per_min = 200
  words_per_sec = words_per_min / 60
  
  total_time = (text.split(' ').length)/words_per_sec
  minutes = (total_time / 60) % 60
  seconds = total_time % 60
  
  return "#{minutes} minutes : #{seconds} seconds"
end