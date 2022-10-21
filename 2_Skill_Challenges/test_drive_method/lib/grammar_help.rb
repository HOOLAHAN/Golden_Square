# File: lib/grammar_help

def grammar_checker(text)
  if !text.is_a? String
    return "Not a string"
  elsif (text[0].capitalize == text[0]) && (text.chars.last == ( "." || "?" || "!" ))
    return "Good grammar!"
  else 
    return "Bad grammar!"
  end
end