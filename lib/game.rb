# frozen_string_literal: true

require_relative 'game_structure/game_winner'
require_relative 'game_structure/game_board'

# class for handling players' input
class Game < GameWinner
  attr_reader :game_board, :players_details

  def initialize
    super
    @game_board = GameBoard.new
    @players_details = Players.new
    @player_one_moves = []
    @player_two_moves = []
  end
end
