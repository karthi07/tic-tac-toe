class BoardGame
  attr_reader :the_board

  def initialize
    @the_board = {
      1 => ' ', 2 => ' ', 3 => ' ',
      4 => ' ', 5 => ' ', 6 => ' ',
      7 => ' ', 8 => ' ', 9 => ' '
    }

    @winning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
  end

  def check_winning
    win = false
    @winning.each do |win_arr|
      place1 = @the_board[win_arr[0] + 1]
      place2 = @the_board[win_arr[1] + 1]
      place3 = @the_board[win_arr[2] + 1]
      win = place1 if place1 == place2 && place2 == place3 && place1 != ' '
    end
    win
  end

  def add_move(move, turn)
    res = 'added'
    res = 'Error' unless @the_board[move] == ' ' && ([1, 2, 3, 4, 5, 6, 7, 8, 9].include? move)

    move = Integer(move)
    @the_board[move] = turn
    res
  end

  def restart_game
    @the_board = {
      1 => ' ', 2 => ' ', 3 => ' ',
      4 => ' ', 5 => ' ', 6 => ' ',
      7 => ' ', 8 => ' ', 9 => ' '
    }
  end
end