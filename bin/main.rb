#!/usr/bin/env ruby

require 'io/console'
require './lib/board_game'

class GamePlay < BoardGame

  def initialize
    super
    @player1 = ""
    @player2 = ""
  end

  def puts_center(str)
    @screen_width = IO.console.winsize[1]
    padding = (@screen_width - str.size) / 2
    puts String.new(' ' * padding) + str
  end

  def print_board() # rubocop:disable Metrics/AbcSize
    str1 = (' ' * 7) + '|' + (' ' * 7) + '|' + (' ' * 7)
    str2 = (' ' * 3) + '|' + (' ' * 3)
    str3 = (' ' * 3)
    str4 = ('-' * 7) + '+' + ('-' * 7) + '+' + ('-' * 7)
    puts_center(str1)
    puts_center(str3 + @the_board[1] + str2 + @the_board[2] + str2 + @the_board[3] + str3)
    puts_center(str1)

    puts_center(str4)
    puts_center(str1)
    puts_center(str3 + @the_board[4] + str2 + @the_board[5] + str2 + @the_board[6] + str3)
    puts_center(str1)

    puts_center(str4)
    puts_center(str1)
    puts_center(str3 + @the_board[7] + str2 + @the_board[8] + str2 + @the_board[9] + str3)
    puts_center(str1)
  end

  def get_player_move(player,turn)
    puts player + ' your turn, remember you\'re using ' + turn + '  Move on which space?'
    puts 'available space 1 2 3 4 5 6 7 8 9'
    move = gets.chomp.to_i

    while add_move(move, turn) != 'added'
      puts "Its a invalid move. Enter valid move \n"
      move = gets.chomp.to_i
    end
  end

  def get_player_names
    rules = "This is a tic-tac-toe game played between two people it is a board game of 3 horizontal
    vertical and two diagonal spaces. It involves choosing a game character X or O to fill up the spaces, if any
    player is able to fill the empty spaces with his/her character horizontaly, vertically or diagonally
    a winner emerges and we start again and if there\'s a tie, we start the game again."
    puts rules
    puts ' '
    puts 'player 1 whats your name'
    puts ' '
    player1 = gets.chomp
    while player1.length == 0
      puts "Name cant be blank. Enter a valid name \n"
      player1 = gets.chomp
    end
    puts ' '
    puts player1 + ' will be playing with X'
    puts ' '
    puts 'player2 whats your name'
    puts ' '
    player2 = gets.chomp
    while player2.length == 0
      puts "Name cant be blank. Enter a valid name \n"
      player2 = gets.chomp
    end
    puts ' '
    puts player2 + ' will be playing with O'
    return player1, player2
  end

  def game_play() # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    turn = 'X'
    players = get_player_names()
    player1 = players[0]
    player2 = players[1]
    player = player1
    res = false
    i = 0
    while i < 9
      print_board()
      get_player_move(player,turn)
      player = player == player1 ? player2 : player1
      turn = turn == 'X' ? 'O' : 'X'
      res = check_winning
      if res
        puts_center(res + " won the Game \n\n\n")
        break
      end
      i += 1
    end
    puts_center('Game tied') unless res
    print_board()
    restart_game
  end
end

play1 = GamePlay.new

play1.game_play
puts 'do you want to restart the game ? (y/n)'
choice = gets.chomp
while choice != 'n' && choice == 'y'
  play1.game_play
  puts 'do you want to restart the game ? (y/n)'
  choice = gets.chomp
end
while choice == 'n'
  puts 'game-ends re-run file to resume'
  break
end
