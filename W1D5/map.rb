class Map
  attr_reader :map, :default

  def initialize(default = nil)
    @map = []
    @default = default
  end

  def set(key, value = default)
    key_pos = find_key(key)
    if key_pos
      map[key_pos][1] = value
    else
      map.push([key, value])
    end
  end

  def get(key)
    key_pos = find_key(key)
    if key_pos
      map[key_pos][1]
    else
      default
    end
  end

  def delete(key)
    key_pos = find_key(key)
    map.delete_at(key_pos) if key_pos
  end

  def show
    map
  end

  def find_key(key)
    map.each_with_index { |pair, i| return i if pair.first == key}
    nil
  end

end
