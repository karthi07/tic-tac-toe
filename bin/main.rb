#!/usr/bin/env ruby

require 'io/console'

SCREEN_SIZE = IO.console.winsize
$SCREEN_HEIGHT =  SCREEN_SIZE[0]
$SCREEN_WIDTH =  SCREEN_SIZE[1]

class BoardGame

  attr_accessor :the_board

  def initialize

    @x = 2
    @the_board = { 1 => ' ', 2 => ' ', 3=> ' ',
    4 => ' ', 5 => ' ', 6 => ' ',
    7 => ' ', 8 => ' ', 9 => ' '}

    @winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  end

  def add_move(move, turn)
    if move.is_a? Integer 
      move = Integer(move)

    else
      return "Error"
    end
    if @the_board[move] == ' ' && ([1,2,3,4,5,6,7,8,9].include? move )
      move = Integer(move)
      @the_board[move] = turn
      return "added"
    else 
      return "Error"
    end
  end


  def init_cell_size(cs)
    cs = ((cs / 2 ) * 2) + 1
    if $SCREEN_HEIGHT < ((cs * 3) + 10)
      cs = (($SCREEN_HEIGHT / 2) - 10) / 3
    end
    if $SCREEN_WIDTH < ((cs * 3 * 2) + 2)
      cs = (($SCREEN_WIDTH / 2) - 2) / 6
    end
    if $SCREEN_HEIGHT < ((cs * 3) + 10)
      cs = (($SCREEN_HEIGHT / 2) - 10) / 3
    end
    cs
  end

  def puts_center(str)
    padding = ($SCREEN_WIDTH - str.size) / 2
    puts String.new(" " * padding) + str
  end

  def printBoard()
    board = @the_board
    puts_center (' '*3) + ' ' + (' '*3) + '|' + (' '*3) + ' '+(' '*3) + '|' + (' '*3)+' '+(' '*3)
    puts_center (' '*3) + board[1] + (' '*3) + '|' + (' '*3) + board[2]+(' '*3) + '|' + (' '*3)+board[3]+(' '*3)
    puts_center (' '*3) + ' '+ (' '*3) + '|' + (' '*3) + ' '+(' '*3) + '|' + (' '*3)+' '+(' '*3)

    puts_center ('-'*7)+'+'+('-'*7)+'+'+('-'*7)
    puts_center (' '*3) + ' ' + (' '*3) + '|' + (' '*3) + ' '+(' '*3) + '|' + (' '*3)+' '+(' '*3)
    puts_center (' '*3) + board[4] + (' '*3) + '|' + (' '*3) + board[5]+(' '*3) + '|' + (' '*3)+board[6]+(' '*3)
    puts_center (' '*3) + ' ' + (' '*3) + '|' + (' '*3) + ' '+(' '*3) + '|' + (' '*3)+' '+(' '*3)

    puts_center ('-'*7)+'+'+('-'*7)+'+'+('-'*7)
    puts_center (' '*3) + ' ' + (' '*3) + '|' + (' '*3) + ' '+(' '*3) + '|' + (' '*3)+' '+(' '*3)
    puts_center (' '*3) + board[7] + (' '*3) + '|' + (' '*3) + board[8]+(' '*3) + '|' + (' '*3)+board[9]+(' '*3)
    puts_center (' '*3) + ' ' + (' '*3) + '|' + (' '*3) + ' '+(' '*3) + '|' + (' '*3)+' '+(' '*3)
  end

end

#default first player
turn = "X"

play1 = BoardGame.new

i = 0
while i < 9 do
  move=99
  puts play1.printBoard()
  puts " "
  puts'Turn for ' + turn + '. Move on which space?'," "
  puts 'available space 1 2 3 4 5 6 7 8 9'
  move = (gets.chomp).to_i
  
  while (play1.add_move(move,turn) != "added") do
    puts "Its a invalid move. Enter valid move "
    puts " "
    puts'Turn for ' + turn + '. Move on which space?'," "
    puts 'available space 1 2 3 4 5 6 7 8 9'
    move = (gets.chomp).to_i
  end
  if turn == "X"
      turn = "O"
  else
      turn = "X"
  end

  i = i+1
end
play1.printBoard()
