# File: lib/to_do_list.rb

def to_do_check(text)
  if !text.is_a? String
    return false
  elsif
    text.include? "#TODO" 
    return true
  else
    return false
  end
end