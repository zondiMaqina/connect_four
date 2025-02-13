#frozen_string_literal: true
require 'colorize'

# class for gathering players' data
class Players
  attr_reader :game_players, :chosen_moves, :available_colors

  def initialize
    @game_players = []
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

  def choose_color
    show_colors
    puts 'Choose your color to play with :)'
    @chosen_moves << "\u25A0".colorize(chosen_color.to_sym) # returns valid chosen color
  end

  def show_colors
    puts <<-HEREDOC
      The evailable colors to choose from are
      #{@available_colors}
    HEREDOC
  end

  def chosen_color
    color = gets.chomp
    until @available_colors.include?(color)
      puts 'Color does not exist or already chosen'
      color = gets.chomp
    end
    return @available_colors.delete(color)
  end
end
