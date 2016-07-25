require 'board'

describe Board do
  it 'has 64 squares' do
    expect(Board.new.number_of_squares).to eq(64)
  end

  it 'responds to a call for resetting it' do
    expect(Board.new).to respond_to(:reset)
  end

  it 'has number of pieces between 0 and 32' do
    expect(Board.new.number_of_pieces).to be_between(0, 32)
  end

  it 'responds to request for making moves' do
    expect(Board.new).to respond_to(:move)
  end

  context 'upon reset' do
    let(:board) { Board.new }
    before(:example) do
      board.reset
    end

    it 'has next move given to white' do
      expect(board.next_move).to eq("W")
    end

    it 'number of pieces should be equal to 32' do
      expect(board.number_of_pieces).to eq(32)
    end

    it 'has the square b4 empty' do
      expect(board['b4']).to eq('E')
    end

    it 'has the square d1 with the white queen' do
      expect(board['d1']).to eq('Q')
    end

    it 'has the square c8 with the black bishop' do
      expect(board['c8']).to eq('b')
    end

    context 'upon move e4' do
      before(:example) do
        board.move('P e2 e4')
      end

      it 'has the square e2 empty' do
        expect(board['e2']).to eq('E')
      end

      it 'has the square e4 with a white pawn' do
        expect(board['e4']).to eq('P')
      end

      it 'lets black play the next move' do
        expect(board.next_move).to eq('B')
      end

      context 'black replies with P d7 d5' do
        before(:example) do
          board.move("p d7 d5")
        end

        it 'has the square d5 with black pawn' do
          expect(board['d5']).to eq('p')
        end

        it 'has the square d7 empty' do
          expect(board['d7']).to eq('E')
        end
      end
    end
  end
end
