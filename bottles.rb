# frozen_string_literal: true

# Incomprehensible conciseness error
# class Bottles
#   def song
#     verses(99, 0)
#   end

#   def verses(hi, lo)
#     hi.downto(lo).map { |n| verse(n) }.join("\n")
#   end

#   def verse(n)
#     "#{n == 0 ? 'No more' : n} bottle#{'s' if n != 1}" + ' of beer on the wall, ' +
#       "#{n == 0 ? 'no more' : n} bottle#{'s' if n != 1} of beer.\n" +
#       "#{if n > 0
#            "Take #{n > 1 ? 'one' : 'it'} down and pass it around"
#          else
#            'Go to the store and buy some more'
# end}, " +
#       "#{if n - 1 < 0
#            99
#          else
#            n - 1 == 0 ? 'no more' : n - 1
# end} bottle#{'s' if n - 1 != 1}" +
#       " of beer on the wall.\n"
#   end
# end

# ------------------------------------------------
# The following does many things well, but can't resist indulging in unnecessary complexity
# class Bottles
#   NoMore = lambda do |_verse|
#     'No more bottles of beer on the wall, ' +
#       "no more bottles of beer.\n" +
#       'Go to the store and buy some more, ' +
#       "99 bottles of beer on the wall.\n"
#   end

#   LastOne = lambda do |_verse|
#     '1 bottle of beer on the wall, ' +
#       "1 bottle of beer.\n" +
#       'Take it down and pass it around, ' +
#       "no more bottles of beer on the wall.\n"
#   end

#   Penultimate = lambda do |_verse|
#     '2 bottles of beer on the wall, ' +
#       "2 bottles of beer.\n" +
#       'Take one down and pass it around, ' +
#       "1 bottle of beer on the wall.\n"
#   end

#   Default = lambda do |verse|
#     "#{verse.number} bottles of beer on the wall, " +
#       "#{verse.number} bottles of beer.\n" +
#       'Take one down and pass it around, ' +
#       "#{verse.number - 1} bottles of beer on the wall.\n"
#   end

#   def song
#     verses(99, 0)
#   end

#   def verses(finish, start)
#     finish.downto(start).map { |verse_number| verse(verse_number) }.join("\n")
#   end

#   def verse(number)
#     verse_for(number).text
#   end

#   def verse_for(number)
#     case number
#     when 0 then Verse.new(number, &NoMore)
#     when 1 then Verse.new(number, &LastOne)
#     when 2 then Verse.new(number, &Penultimate)
#     else Verse.new(number, &Default)
#     end
#   end
# end

# class Verse
#   attr_reader :number
#   def initialize(number, &lyrics)
#     @number = number
#     @lyrics = lyrics
#   end

#   def text
#     @lyrics.call self
#   end
# end
# ----------------------------------------------
# The following solution seems just right
# However, it is too complicated
# and the effort to write it is just too much
# One of its main problems is the programmer runs out of patience
# class Bottles
#   def song
#     verses(99, 0)
#   end

#   def verses(bottles_at_start, bottles_at_end)
#     bottles_at_start.downto(bottles_at_end).map do |bottles|
#       verse(bottles)
#     end.join("\n")
#   end

#   def verse(bottles)
#     Round.new(bottles).to_s
#   end
# end

# class Round
#   attr_reader :bottles

#   def initialize(bottles)
#     @bottles = bottles
#   end

#   def to_s
#     challenge + response
#   end

#   def challenge
#     bottles_of_beer.capitalize + ' ' + on_wall + ', ' + bottles_of_beer + ".\n"
#   end

#   def response
#     go_to_the_store_or_take_one_down + ', ' + bottles_of_beer + ' ' + on_wall + ".\n"
#   end

#   def bottles_of_beer
#     "#{anglicized_bottle_coun} #{pluralized_bottle_form} of #{beer}"
#   end

#   def beer
#     'beer'
#   end

#   def on_wall
#     'on the wall'
#   end

#   def pluralized_bottle_form
#     last_beer? ? 'bottle' : 'bottles'
#   end

#   def anglicized_bottle_coun
#     all_out? ? 'no more' : bottles.to_s
#   end

#   def go_to_the_store_or_take_one_down
#     if all_out?
#       @bottles = 99
#       buy_new_beer
#     else
#       lyrics = drink_beer
#       @bottles -= 1
#       lyrics
#     end
#   end

#   def drink_beer
#     "Take #{it_or_one} down and pass it around"
#   end

#   def buy_new_beer
#     'Go to the store and buy some more'
#   end

#   def it_or_one
#     last_beer? ? 'it' : 'one'
#   end

#   def all_out?
#     bottles.zero?
#   end

#   def last_beer?
#     bottles == 1
#   end
# end

# -------------------------------------------
# The following shows patience and solves all
# the problems before
class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    case number
    when 0
      'No more bottles of beer on the wall, ' +
        "no more bottles of beer.\n" +
        'Go to the store and buy some more, ' +
        "99 bottles of beer on the wall.\n"
    when 1
      '1 bottle of beer on the wall, ' +
        "1 bottle of beer.\n" +
        'Take it down and pass it around, ' +
        "no more bottles of beer on the wall.\n"
    when 2
      '2 bottles of beer on the wall, ' +
        "2 bottles of beer.\n" +
        'Take one down and pass it around, ' +
        "1 bottle of beer on the wall.\n"
    else
      "#{number} bottles of beer on the wall, " +
        "#{number} bottles of beer.\n" +
        'Take one down and pass it around, ' +
        "#{number - 1} bottles of beer on the wall.\n"
    end
  end
end
