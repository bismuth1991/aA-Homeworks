def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == direction
  end
end

def constant_dance(direction, tiles_hash)
  tiles_hash[direction]
end

if __FILE__ == $PROGRAM_NAME
  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
  tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
  }

  p slow_dance("left-up", tiles_array) == 7
  p constant_dance("left-up", tiles_hash) == 7
end
