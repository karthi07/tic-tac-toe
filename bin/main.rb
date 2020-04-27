#!/usr/bin/env ruby

require 'io/console'
require_relative 'game_logic'

def puts_center(str)
  @screen_width = IO.console.winsize[1]
  padding = (@screen_width - str.size) / 2
  puts String.new(' ' * padding) + str
end

def print_board(board) # rubocop:disable Metrics/AbcSize
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

def game_play(play1) # rubocop:disable Metrics/MethodLength
  turn = 'X'
  res = false
  board = play1.the_board
  i = 0
  while i < 9
    puts print_board(board)
    puts 'Turn for ' + turn + '. Move on which space?'
    puts 'available space 1 2 3 4 5 6 7 8 9'
    move = gets.chomp.to_i

    while play1.add_move(move, turn) != 'added'
      puts "Its a invalid move. Enter valid move \n"
      move = gets.chomp.to_i
    end
    turn = turn == 'X' ? 'O' : 'X'
    res = play1.check_winning
    if res
      puts_center(res + " won the Game \n\n\n")
      break
    end
    i += 1
  end
  puts_center('Game tied') unless res
  print_board(board)
  play1.restart_game
end

play1 = BoardGame.new
game_play(play1)
puts 'do you want to restart the game ? (y/n)'
choice = gets.chomp
while choice != 'n' && choice == 'y'
  game_play(play1)
  puts 'do you want to restart the game ? (y/n)'
  choice = gets.chomp
end
while choice == 'n'
  puts 'game-ends re run file to resume'
  break
end
