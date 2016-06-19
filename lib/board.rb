require "pry"
class Board
  attr_accessor :spaces, :board
  attr_reader :mine
  def initialize(row_number, mine_number)
    @row_number = row_number
    @mine_count = mine_number
    @board = []
    @mine = "X"
  end

  def board_creation
    @row_number.times do |space|
      @board << []
      @row_number.times do
        @board[space] << nil
      end
    end
  end

  def place_mines
    until @mine_count == 0
      row_count = rand(0...@row_number)
      column_count = rand(0...@row_number)
      if @board[row_count][column_count] != @mine
        @board[row_count][column_count] = @mine
        @mine_count -= 1
      end
    end
  end
end
