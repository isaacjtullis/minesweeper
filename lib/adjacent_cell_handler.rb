require 'pry'
module AdjacentCellHandler
    #tweak contains_mine to make it work
    #finish putting in the variables that adjacent_cell_finder needs
  def self.contains_mine?(row, col, formation)
    if formation.board[row][col] == formation.mine
      return true
    end
    return false
  end

  def self.mine_finder(row, col, row_count, column_count, formation)
    surrounding_mines = 0
    if row > 0
      if col > 0
        surrounding_mines += 1 if contains_mine?(row - 1, col - 1, formation)
      end
    end

    if col > 0
      surrounding_mines += 1 if contains_mine?(row, col - 1, formation)
    end

    if row < row_count - 1
      if col > 0
        surrounding_mines += 1 if contains_mine?(row + 1, col - 1, formation)
      end
    end

    if row > 0
      surrounding_mines += 1 if contains_mine?(row - 1, col, formation)
    end

    if row < row_count - 1
      surrounding_mines += 1 if contains_mine?(row + 1, col, formation)
    end

    if row > 0
      if col < column_count - 1
        surrounding_mines += 1 if contains_mine?(row - 1, col + 1, formation)
      end
    end

    if col < column_count - 1
      surrounding_mines += 1 if contains_mine?(row, col + 1, formation)
    end

    if row < row_count - 1
      if col < column_count - 1
        surrounding_mines += 1 if contains_mine?(row + 1, col + 1, formation)
      end
    end
    surrounding_mines
  end

  def self.adjacent_cells(row, col, row_count, column_count)

    cleared_cells = []
    if row > 0
      if col > 0
        cleared_cells << [row - 1, col - 1]
      end
    end

    if col > 0
      cleared_cells << [row, col - 1]
    end

    if row < row_count - 1
      if col > 0
        cleared_cells << [row + 1, col - 1]
      end
    end

    if row > 0
      cleared_cells << [row - 1, col]
    end

    if row < row_count - 1
      cleared_cells << [row + 1, col]
    end

    if row > 0
      if col < column_count - 1
        cleared_cells << [row - 1, col + 1]
      end
    end

    if col < column_count - 1
      cleared_cells << [row, col + 1]
    end

    if row < row_count - 1
      if col < column_count - 1
        cleared_cells << [row + 1, col + 1]
      end
    end
    cleared_cells
  end
end
