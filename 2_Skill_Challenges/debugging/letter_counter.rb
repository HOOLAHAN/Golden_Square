class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new(0) # => edit: start at zero
    most_common = nil
    most_common_count = 0 # => edit: start at zero
    @text.downcase.chars.each do |char| # => edit: all letters formatted to lowercase
      next unless is_letter?(char)
      counter[char] += 1 # => edit: counter increase by 1 each iteration
      next unless counter[char] > most_common_count # => edit: changed to next unless statement
      most_common = char
      most_common_count = counter[char] # => edit: removed + sign
    end
    return [most_common_count, most_common] 
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Intended output:
# [2, "i"]