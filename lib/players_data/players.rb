#frozen_string_literal: true
require 'colorize'

# class for gathering players' data
class Players
  attr_reader :game_players

  def initialize
    @game_players = []
    @players_colors = []
    @available_colors = %w[red green white orange]
    @chosen_moves = []
  end

  def receive_player1_name
    puts 'Enter your name player 1'.bold
    game_players << gets.chomp # player name
  end

  def receive_player2_name
    puts 'Enter your name player 2'.bold
    game_players << gets.chomp # player name
  end
end
