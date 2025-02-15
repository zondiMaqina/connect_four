# frozen_string_literal: true

require_relative 'game_structure/game_winner'
require_relative 'game_structure/game_board'
require_relative 'players_data/players'

# class for handling players' input
class Game < GameWinner
  attr_reader :game_board, :players_data

  def initialize
    super
    @game_board = GameBoard.new
    @players_data = Players.new
    @player_one_moves = []
    @player_two_moves = []
  end

  def start_game
    players_data.receive_players_data
    show_rules
  end

  def show_rules
    puts <<-HEREDOC
      CONNECT_FOUR
      -------------------------------
      Welcome to the connect_four game !!! to play game,simply connect four moves on the board that will show by playing on the position on the board using 'xy' as your corrdinates where x is the row and y ic the column LAWS OF PHYSICS APPLY
      GOOD LUCK !!!!!! :)
    HEREDOC
    sleep(2)
  end
end
