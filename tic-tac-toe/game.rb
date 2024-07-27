require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @current_player = @player1
  end

  def play
    @board.print_board
    until game_over?
      @current_player.make_move(@board)
      @board.print_board
      break if game_over?

      switch_players
    end
    print_result
  end

  private

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def game_over?
    @board.check_winner || @board.check_draw
  end

  def print_result
    if @board.check_winner
      puts "#{@current_player.name} wins!"
    else
      puts "It's a draw!"
    end
  end
end
