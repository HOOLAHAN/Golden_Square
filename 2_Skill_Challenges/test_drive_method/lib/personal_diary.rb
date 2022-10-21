# File: lib/personal_diary.rb

def make_snippet(diary_entry)
  array = diary_entry.split(' ')
  return array[0..4].join(' ') + " ..."
end