require 'board'

describe Board do
  it 'has 64 squires' do
    expect(Board.new.number_of_squares).to eq(64)
  end

  it 'should respond a call for resetting it' do
    expect(Board.new).to respond_to(:reset)
  end

  it 'should have number of pieces between 0 and 32' do
    expect(Board.new.number_of_pieces).to be_between(0, 32)
  end

  context 'upon reset' do
    let(:board) { Board.new }
    before(:example) do
      board.reset
    end

    it 'number of pieces should be equal to 32' do
      expect(board.number_of_pieces).to eq(32)
    end

    it 'should have the square b4 empty' do
      expect(board['b4']).to eq('E')
    end

    it 'should have the square d1 with the white queen' do
      expect(board['d1']).to eq('Q')
    end

    it 'should have the square c8 with the black bishop' do
      expect(board['c8']).to eq('b')
    end
  end
end
