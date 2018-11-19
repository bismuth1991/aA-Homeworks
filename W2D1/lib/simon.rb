class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system('clear')

    until self.game_over
      sleep(1)
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    shown = show_sequence
    input = require_sequence


    if shown != input
      self.game_over = true
    else
      round_success_message
    end

    self.sequence_length += 1
  end

  def show_sequence
    self.seq = []
    self.add_random_color

    puts "PLEASE PAY CLOSE ATTENTION TO THE SEQUENCE..."
    sleep(1)

    seq.each do |color|
      system('clear')
      sleep(0.5)

      puts color

      sleep(0.5)
    end

    seq
  end

  def require_sequence
    system('clear')
    puts "Please re-input the shown sequence: eg. rbgy"
    input = gets.chomp.split("").map do |color|
      case color
      when "r"
        "red"
      when "b"
        "blue"
      when "g"
        "green"
      when "y"
        "yellow"
      else
        raise "wrong input!"
      end
    end
  rescue
    puts "Please re-input the shown sequence: eg. rbgy"
    retry

    input
  end

  def add_random_color
    sequence_length.times do
      seq << COLORS.sample
    end
  end

  def round_success_message
    puts "YOU HAVE GOOD MEMORY!"
  end

  def game_over_message
    puts "YOU LOST!!!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []

    # puts "RETRY? y/n"
    # input = gets.chomp
    # if input.downcase == "y"
    #   self.play
    # else
    #   return
    # end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
