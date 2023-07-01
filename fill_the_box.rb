# class Box has properties volume, x, y, z and shortes side
class Box
  attr_reader :volume, :x, :y, :z, :min_side
  
  def initialize(arr) 
    @x = arr[0].to_i
    @y = arr[1].to_i
    @z = arr[2].to_i
    @volume = @x * @y * @z #volume of box
    @min_side = [@x, @y, @z].min #shortest side of box, for calculation if future
  end
end

# class Cube has properties volume, side and quantity of this specific cube
class Cube
  attr_reader :volume, :side, :quantity

  def initialize(quantity, side)
    @quantity = quantity.to_i 
    @side = 2 ** side.to_i #calculation with power of 2
    @volume = @side ** 3 #volume of ONE cube
  end
end

# module FillingTheBox has algorithm for filling the box
module FillingTheBox
  #checks if volume of box is bigger then volume of all boxes (for early return, less calculation)
  def self.check_volumes(box, cubes) 
    all_cubes_volume = 0
    cubes.each do |cube|
      all_cubes_volume += cube.volume*cube.quantity
    end
    return false if (box.volume > all_cubes_volume)
    return true
  end

  def self.calculation(box, cubes)
    return -1 unless self.check_volumes(box, cubes) #early return comparing box vol vs all cubes vol
    original_box_vol = box.volume
    cubes = cubes.reverse
    left_box_vol = nil
    result = 0
    cubes.each do |cube|
      next if (cube.side > box.min_side) # skipping cube if cube's side bigger then shortes side of box
      left_box_vol = original_box_vol - cube.quantity * cube.volume
      if (left_box_vol < 0)
        tmp = (original_box_vol/cube.volume).floor # finding max integer number of box fiting in box
        result += tmp
        break if (tmp * cube.volume == original_box_vol) # exiting the loop if box filled 
      else
        result += cube.quantity
        original_box_vol = left_box_vol
      end
    end
    return result
  end
end

# func for checking if element is numeric
def numeric?(lookAhead)
  lookAhead.match?(/[[:digit:]]/)
end

def main_calculation(line)
  arr = line.split
  return puts "-1" unless validation(arr)
  box = Box.new(arr)
  cubes = []
  dirt_cubes_arr = arr.slice(3, arr.length)
  dirt_cubes_arr.each_with_index do |el, index|
    cubes.push(Cube.new(el, index))
  end
  res = FillingTheBox.calculation(box, cubes)
  puts "line: #{line}"
  puts "result: #{res}"
  10.times {print "---"}
  print "\n"
end

def validation(arr)
  passed = true
  arr.each do |el|
    if numeric?(el)
      next
    else
      passed = false
      break
    end
  end
  return passed
end

def parse(line)
  if(line.include?('.txt'))
    File.foreach(line) do |line|
      main_calculation(line)
    end
  else
    main_calculation(line)
  end
end

def main(lines_feed)
  lines_feed.each_with_index do |line, index|
    parse(line)
  end
end

lines_feed = []

ARGV.each do |a|
  lines_feed.push(a)
end

main(lines_feed)
