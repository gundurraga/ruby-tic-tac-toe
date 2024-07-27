class Board
  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def print_board
    puts '  1 2 3'
    @grid.each_with_index do |row, i|
      print "#{i + 1} "
      row.each do |cell|
        print cell.nil? ? '- ' : "#{cell} "
      end
      puts
    end
  end

  def place_mark(row, col, mark)
    @grid[row - 1][col - 1] = mark
  end

  def position_taken?(row, col)
    !@grid[row - 1][col - 1].nil?
  end

  def check_rows
    @grid.each do |row|
      return true if row.uniq.size == 1 && !row[0].nil?
    end
    false
  end

  def check_columns
    @grid.transpose.each do |column|
      return true if column.uniq.size == 1 && !column[0].nil?
    end
    false
  end

  def check_diagonals
    left_diagonal = [@grid[0][0], @grid[1][1], @grid[2][2]]
    right_diagonal = [@grid[0][2], @grid[1][1], @grid[2][0]]

    [left_diagonal, right_diagonal].any? { |diagonal| diagonal.uniq.size == 1 && !diagonal[0].nil? }
  end

  def check_winner
    check_rows || check_columns || check_diagonals
  end

  def check_draw
    @grid.flatten.none?(&:nil?) && !check_winner
  end
end
