# frozen_string_literal: true

require 'colorize'

# class for gathering players' data
class Players
  attr_reader :game_players, :chosen_moves, :available_colors

  def initialize
    @game_players = []
    @available_colors = %w[red green white blue]
    @chosen_moves = []
  end

  def receive_players_data
    receive_player1_name
    receive_player2_name
    show_players_details
  end

  def receive_player1_name
    puts 'Enter your name player 1'.bold
    game_players << gets.chomp # player name
    choose_color
  end

  def receive_player2_name
    puts 'Enter your name player 2'.bold
    game_players << gets.chomp # player name
    choose_color
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
    @available_colors.delete(color)
  end

  def show_players_details
    puts "The players #{@game_players} have entered the game"
  end
end
