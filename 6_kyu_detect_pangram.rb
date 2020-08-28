# frozen_string_literal: true

# A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

# Time complexity: O(n)
# Space complexity: O(1)

def panagram?(string)
  return false if string.empty?
  return false if string.chars.count < 26

  chars = string.delete(' ').downcase.chars.uniq.select { |char| char =~ /[a-z]/ }
  chars.count == 26
end
