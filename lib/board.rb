class Board
  def initialize
    restart_game
  end

  def restart_game
    @the_board = {
      1 => ' ', 2 => ' ', 3 => ' ',
      4 => ' ', 5 => ' ', 6 => ' ',
      7 => ' ', 8 => ' ', 9 => ' '
    }
  end
end
