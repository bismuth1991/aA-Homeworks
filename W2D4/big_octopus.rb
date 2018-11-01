def sluggish_octopus(arr)
  arr.each do |fish1|
    return fish1 if arr.all? { |fish2| fish1.length >= fish2.length }
  end
end

def dominant_octopus(arr)
  arr.merge_sort { |x, y| y.length <=> x.length }[0]
end

def clever_octopus(arr)
  longest_fish = arr.shift

  arr.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end

  longest_fish
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length <= 1

    mid_idx = self.length / 2
    sorted_left = self.take(mid_idx).merge_sort(&prc)
    sorted_right = self.drop(mid_idx).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) == -1
        result << left.shift
      else
        result << right.shift
      end
    end

    result + left + right
  end
end

if __FILE__ == $PROGRAM_NAME
  arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  p sluggish_octopus(arr) == "fiiiissshhhhhh"
  p dominant_octopus(arr) == "fiiiissshhhhhh"
  p clever_octopus(arr) =="fiiiissshhhhhh"
end
