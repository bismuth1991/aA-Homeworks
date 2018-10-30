require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    Array.new(14).map.with_index do |cup, i|
      if i == 6 || i == 13
        []
      else
        [:stone] * 4
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if cups[start_pos].nil?
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]

    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      if cup_idx == 6
        cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        cups[13] << stones.pop if current_player_name == @name2
      else
        cups[cup_idx] << stones.pop
      end

      system('clear')
      render
      sleep(0.5)
    end

    system('clear')
    render
    sleep(2)
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 13 || ending_cup_idx == 6
      :prompt
    elsif cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |i| cups[i].empty? } || (7..12).all? { |i| cups[i].empty? }
  end

  def winner
    case cups[6] <=> cups[13]
    when 0
      :draw
    when 1
      @name1
    when -1
      @name2
    end
  end
end
