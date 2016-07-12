class Board
  attr_reader :number_of_squares, :number_of_pieces, :next_move, :squares

  @@file_mapping = {
    'a' => 0,
    'b' => 1,
    'c' => 2,
    'd' => 3,
    'e' => 4,
    'f' => 5,
    'g' => 6,
    'h' => 7
  }

  def initialize
    @number_of_squares = 64
    @number_of_pieces = 0
    @squares = [
      'R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R',
      'P', 'P', 'P', 'P', 'P', 'P', 'P', 'P',
      'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E',
      'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E',
      'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E',
      'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E',
      'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p',
      'r', 'n', 'b', 'q', 'k', 'b', 'n', 'r'
    ]
    @next_move = 'W'
  end

  def reset
    @number_of_pieces = 32
    @next_move = 'W'
  end

  def [](square)

    square_index = ((square[1].to_i - 1) * 8) + @@file_mapping[square[0]]
    @squares[square_index]
  end

  def move(move_string)

    piece, from, to = move_string.split(' ')
    piece = piece.upcase if @next_move == 'W'

    from = ((from[1].to_i - 1) * 8) + @@file_mapping[from[0]]
    to = ((to[1].to_i - 1) * 8) + @@file_mapping[to[0]]

    @squares[to] = piece
    @squares[from] = 'E'

    if @next_move == 'W'
      @next_move = 'B'
    else
      @next_move = 'W'
    end
  end
end
