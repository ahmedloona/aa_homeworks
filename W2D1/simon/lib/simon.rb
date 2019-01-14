class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      self.take_turn
      self.add_random_color
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    self.round_success_message
    self.sequence_length += 1
  end

  def show_sequence
    self.add_random_color
  end

  def require_sequence

  end

  def add_random_color
    self.seq.push(COLORS.shuffle.first)
  end

  def round_success_message
    "#{"round over"}"
  end

  def game_over_message
    "#{"The game is over"}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
