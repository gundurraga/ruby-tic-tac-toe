class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def make_move(board)
    loop do
      row, col = get_move
      return board.place_mark(row, col, @mark) unless board.position_taken?(row, col)

      puts 'That position is already taken. Please try again.'
    end
  end

  private

  def get_move
    loop do
      print "#{@name}, enter your move (row column): "
      input = gets.chomp.split.map(&:to_i)
      return input if input.length == 2 && input.all? { |n| n.between?(1, 3) }

      puts 'Invalid input. Please enter two numbers between 1 and 3, separated by a space.'
    end
  end
end
