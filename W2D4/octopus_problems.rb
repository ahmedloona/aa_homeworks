require "byebug"

def sluggish_octopus(foods)
  debugger
  biggest = foods.first
  foods.each_with_index do |food_one, idx_one|
    foods[idx_one + 1..-1].each_with_index do |food_two, idx_two|
      if food_one.length >= food_two.length
        bigger = food_one
      else
        bigger = food_two
      end
      biggest = bigger if bigger.length > biggest.length
    end
  end
  biggest
end

def dominant_octopus(foods)
  sorted_foods = foods.sort {|food_one, food_two| food_one.length <=> food_two.length}
  sorted_foods.last
end

def clever_octopus(foods)
  biggest = ""
  foods.each do |food|
    biggest = food if food.length > biggest.length
  end
  biggest
end

def slow_dance(direction, tiles_array)
  tiles_array.length.times do |idx|
    return idx if tiles_array[idx] == direction
  end
end

def convert_to_hash(tiles_array)
  hash = Hash.new
  tiles_array.each_with_index do |dir, idx|
    hash[dir] = idx
  end
  hash
end

def constant_dance(direction, tiles_hash)
  tiles_hash[direction]
end

if __FILE__ == $PROGRAM_NAME

  foods = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  puts "sluggish octopus: #{sluggish_octopus(foods)}"
  puts "dominant octopus: #{dominant_octopus(foods)}"
  puts "clever octopus: #{clever_octopus(foods)}"

  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up" ]

  puts "direction_index: #{slow_dance("up", tiles_array)}"
  puts "direction_index: #{slow_dance("right-down", tiles_array)}"

  tiles_hash = convert_to_hash(tiles_array)

  puts "direction_index: #{constant_dance("up", tiles_hash)}"
  puts "direction_index: #{constant_dance("right-down", tiles_hash)}"

end
