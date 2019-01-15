require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    self.place_stones
    @name1, @name2 = name1, name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    self.cups.each_with_index do |cup, idx|
        unless idx == 6 || idx == 13
          4.times { cup.push(:stone) }
        end
    end
  end

  def valid_move?(start_pos)
    valid_postitions = (0..13).to_a
    if !valid_postitions.include?(start_pos)
      raise 'Invalid starting cup'
    elsif self.cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
    cup = self.cups[start_pos]
    stone_destination = start_pos
    until cup.empty?
      stone_destination += 1
      stone_destination = 0 if stone_destination > 13
      if stone_destination == 6
        self.cups[6] << cup.pop if current_player_name == @name1
      elsif stone_destination == 13
        self.cups[13] << cup.pop if current_player_name == @name2
      else
        self.cups[stone_destination] << cup.pop
      end
    end

    self.render

    self.next_turn(stone_destination)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
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
    p1_cups_empty = self.cups[0..5].all? {|cup| cup.empty?}
    p2_cups_empty = self.cups[7..12].all? {|cup| cup.empty?}
    p1_cups_empty || p2_cups_empty
  end

  def winner
    if self.cups[6] == self.cups[13]
      :draw
    else
      self.cups[6].count > self.cups[13].count ? @name1 : @name2
    end
  end
end
