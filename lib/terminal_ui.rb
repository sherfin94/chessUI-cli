require_relative 'board'

class TerminalUI
  def initialize
    @board = Board.new
    while true
      display_board
      move = get_next_move
      @board.move(move)
    end
  end

  def display_board
    @board.squares.each_with_index do |square, index|
      print "#{square} " unless square == 'E'
      print "  " if square == "E"
      print "\n" if (index+1)%8 == 0
    end
  end

  def get_next_move
    print "#{@board.next_move}'s move : "
    move = gets
    clear_screen
    move
  end

  def clear_screen
    system 'clear'
  end
end
