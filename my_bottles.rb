class MyBottles
  def verse(number)
    if number == 2
      '2 bottles of beer on the wall, ' +
        "2 bottles of beer.\n" +
        'Take one down and pass it around, ' +
        " 1 bottle of beer on the wall.\n"
    else
      "#{number} bottles of beer on the wall, " << "#{number} bottles of beer.\n" <<
        'Take one down and pass it around, ' <<
        "#{number - 1} bottles of beer on the wall.\n"
    end
  end
end

$my_odd = :odd?
$number = 12

# puts([1, 2, 3, 4, 5].map(&:+))
puts([1, 2, 3, 4, 5].map(&(->(x) { x.odd? })))
