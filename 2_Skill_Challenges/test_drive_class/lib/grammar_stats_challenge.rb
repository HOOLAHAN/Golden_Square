# File: lib/grammar_stats_challenge.rb

class GrammarStats
  def initialize
    @passed_counter = 0
    @total_counts = 0
  end

  def check(text) 
    if !text.is_a? String
      return "Not a string"
    elsif (text[0].capitalize == text[0]) && (text.chars.last == "." || "?" || "!" )
      @passed_counter += 1
      @total_counts += 1
      return true
    else
      @total_counts += 1 
      return false
    end
    # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
  end

  def percentage_good
    return (@passed_counter.to_f / @total_counts.to_f * 100).to_i
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end