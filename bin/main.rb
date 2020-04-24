#!/usr/bin/env ruby

require 'io/console'

class BoardGame
  def initialize
    @the_board = {
      1 => ' ', 2 => ' ', 3 => ' ',
      4 => ' ', 5 => ' ', 6 => ' ',
      7 => ' ', 8 => ' ', 9 => ' '
    }

    @screen_width = IO.console.winsize[1]

    @winning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
  end

  def check_winning
    win = nil
    place1 = @the_board[1]
    place2 = @the_board[2]
    place3 = @the_board[3]

    if place1 == place2 && place2 == place3 && place1 != ' '
      win = place1
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

  def puts_center(str)
    padding = (@screen_width - str.size) / 2
    puts String.new(' ' * padding) + str
  end

  def print_board() # rubocop:disable Metrics/AbcSize
    board = @the_board
    str1 = (' ' * 7) + '|' + (' ' * 7) + '|' + (' ' * 7)
    str2 = (' ' * 3) + '|' + (' ' * 3)
    str3 = (' ' * 3)
    str4 = ('-' * 7) + '+' + ('-' * 7) + '+' + ('-' * 7)
    puts_center(str1)
    puts_center(str3 + board[1] + str2 + board[2] + str2 + board[3] + str3)
    puts_center(str1)

    puts_center(str4)
    puts_center(str1)
    puts_center(str3 + board[4] + str2 + board[5] + str2 + board[6] + str3)
    puts_center(str1)

    puts_center(str4)
    puts_center(str1)
    puts_center(str3 + board[7] + str2 + board[8] + str2 + board[9] + str3)
    puts_center(str1)
  end
end

# default first player
turn = 'X'

play1 = BoardGame.new

i = 0
while i < 9
  puts play1.print_board
  puts 'Turn for ' + turn + '. Move on which space?'
  puts 'available space 1 2 3 4 5 6 7 8 9'
  move = gets.chomp.to_i

  while play1.add_move(move, turn) != 'added'
    puts "Its a invalid move. Enter valid move \n"
    puts 'Turn for ' + turn + '. Move on which space?'
    puts 'available space 1 2 3 4 5 6 7 8 9'
    move = gets.chomp.to_i
  end
  turn = turn == 'X' ? 'O' : 'X'
  res = play1.check_winning
  if res
    puts "\n\n\n   ",res," won the Game \n"
    break
  end
  i += 1
end
play1.print_board
