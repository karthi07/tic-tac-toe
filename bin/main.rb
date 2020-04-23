
require 'io/console'
SCREEN_SIZE = IO.console.winsize
$SCREEN_HEIGHT =  SCREEN_SIZE[0]
$SCREEN_WIDTH =  SCREEN_SIZE[1]

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


the_board = { 1 => ' ', 2 => ' ', 3=> ' ',
    4 => ' ', 5 => ' ', 6 => ' ',
    7 => ' ', 8 => ' ', 9 => ' '}



    def printBoard(board)
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

turn = "X"

for i in 1..9
  puts printBoard(the_board)
    puts " "
    puts'Turn for ' + turn + '. Move on which space?'," "
    puts 'available space 1 2 3 4 5 6 7 8 9'
    move = Integer(gets.chomp)
    the_board[move] = turn
    if turn == "X"
        turn = "O"
    else
        turn = "X"
    end
end
printBoard(the_board)
