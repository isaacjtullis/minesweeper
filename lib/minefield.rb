require 'pry'
require_relative "board"
require_relative "adjacent_cell_handler"
class Minefield
  include AdjacentCellHandler

  attr_reader :row_count, :column_count

  def initialize(row_count, column_count, mine_count)
    @row_count = row_count
    @column_count = column_count
    @mine_count = mine_count
    @total_spaces = column_count * row_count
    @formation = Board.new(@row_count, @mine_count)
    @formation.board_creation
    @formation.place_mines
  end

  def cell_cleared?(row, col)
    condition = true
    if @formation.board[row][col] == nil || @formation.board[row][col] == "X"
      return !condition
    end
    return condition
  end

  def clear(row, col)
    if contains_mine?(row, col)
      @formation.board[row][col] = "detonated"
    elsif !cell_cleared?(row, col)
      @formation.board[row][col] = adjacent_mines(row, col)
      if @formation.board[row][col] == 0
        cells_to_clear = AdjacentCellHandler.adjacent_cells(row, col, @row_count, @column_count)
        #binding.pry
        cells_to_clear.each do |array|
          clear(array[0], array[1])
        end
      #clear(testing[0], testing[1])
      end
    end
  end

  def any_mines_detonated?
    @formation.board.each do |row|
      row.each do |col|
        if col == "detonated"
          return true
        end
      end
    end
    return false
  end

  def all_cells_cleared?
    false
  end

  def adjacent_mines(row, col)
    AdjacentCellHandler.mine_finder(row, col, @row_count, @column_count, @formation)
    #NOTE TO SELF passing in @formation allows me to call the functions of board class into the module THATS AWESOME
  end

  def contains_mine?(row, col)
    if @formation.board[row][col] == @formation.mine
      return true
    end
    return false
  end
end
