require('./bin/main.rb')

test_play = GamePlay.new
describe BoardGame do
  let(:array) { [1, 1, 1, 4, 5] }
  describe '#check_winning' do
    it 'Check if user won for valid winning position at Board for X player ' do
      test_play.the_board[1] = 'X'
      test_play.the_board[2] = 'X'
      test_play.the_board[3] = 'X'
      expect(test_play.check_winning).to eql('X')
    end
    it 'Check if user won for valid winning position at Board for O player ' do
      test_play.the_board[7] = 'O'
      test_play.the_board[5] = 'O'
      test_play.the_board[3] = 'O'
      expect(test_play.check_winning).to eql('O')
    end
    it 'Check if user not won for valid invalid position at Board for any player ' do
      test_play.the_board[1] = 'X'
      test_play.the_board[5] = 'X'
      test_play.the_board[6] = 'X'
      expect(test_play.check_winning).to eql(false)
    end
  end
  describe '#add_move' do
    before(:all) do
      test_play.restart_game # to Reset the Board positions
    end
    it 'Adds the Character for player if it\'s valid move' do
      move = 1
      turn = 'X'
      expect(test_play.add_move(move, turn)).to eql('added')
    end
    it 'Thorw error if the move is out the valid move range' do
      move = 120
      turn = 'O'
      expect(test_play.add_move(move, turn)).to eql('Error')
    end
    it 'Thorw error if the move if place is already occupied by same player' do
      move = 1
      turn = 'X'
      expect(test_play.add_move(move, turn)).to eql('Error')
    end
    it 'Thorw error if the move if place is already occupied by different player' do
      move = 1
      turn = 'O'
      expect(test_play.add_move(move, turn)).to eql('Error')
    end
    it 'Thorw error if the move is not an integer (might be plain enter character)' do
      move = 'abas'.to_i
      turn = 'X'
      expect(test_play.add_move(move, turn)).to eql('Error')
    end
  end
end

describe Board do
  describe '#restart_game' do
    it 'Reset the the_board hash, to start a new game' do
      test_play.the_board[8] = 'X'
      test_play.restart_game
      expect(test_play.the_board[8]).to eql(' ')
    end
    it 'the_board hash preserves data if restart_game not called' do
      test_play.the_board[8] = 'X'
      expect(test_play.the_board[8]).to eql('X')
    end
  end
end

describe GamePlay do
  describe '#show_results' do
    it 'displays player won if check_wining return X as wining character' do
      res = 'X'
      i = 7
      expect(test_play.check_result(res, i)).to eql('win')
    end
    it 'displays player won if check_wining return O as winning character' do
      res = 'O'
      i = 6
      expect(test_play.check_result(res, i)).to eql('win')
    end
    it 'display Game tied, if the no one won and no. of valid play completed' do
      res = false
      i = 8
      expect(test_play.check_result(res, i)).to eql('tied')
    end
    it 'Return nil , if the no one won and game not tied' do
      res = false
      i = 4
      expect(test_play.check_result(res, i)).to eql(nil)
    end
  end

  # describe '#get_player_move' do
  #   it 'Get Player move' do
  #     expect(test_play.get_player_move('karthi', 'X')).to eql(7)
  #   end
  # end
end
