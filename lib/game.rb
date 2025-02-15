# frozen_string_literal: true

require_relative 'game_structure/game_winner'
require_relative 'game_structure/game_board'
require_relative 'players_data/players'

# class for handling players' input
class Game < GameWinner
  attr_reader :board, :players_data, :player_one_moves, :player_two_moves

  def initialize
    super
    @board = GameBoard.new
    @players_data = Players.new
    @player_one_moves = []
    @player_two_moves = []
  end

  def play_game
    players_data.receive_players_data
    show_rules
    loop do
      play_player1
      play_player2
    end
  end

  def play_player1
    puts "Enter move #{players_data.game_players[0]}"
    move_icon = players_data.chosen_moves[0]
    @player_one_moves << verify_move(gets.chomp, move_icon)
  end

  def play_player2
    puts "Enter move #{players_data.game_players[0]}"
    move_icon = players_data.chosen_moves[1]
    @player_two_moves << verify_move(gets.chomp, move_icon)
  end

  def verify_move(input, move_icon)
    adjust_move(input, move_icon) if valid?(input)

    try_again(input)
  end

  def valid?(input)
    x = input[0].to_i
    y = input[1].to_i
    move_valid?(input) && move_appropriate?(input) && current_move_empty?(x, y)
  end

  def move_valid?(input)
    return false if input.size > 2 || input.size < 2

    input[0].to_i.to_s == input[0] && input[1].to_i.to_s == input[1]
  end

  def move_appropriate?(input)
    x = input[0].to_i
    y = input[1].to_i
    x <= 5 && y <= 6
  end

  def try_again(input)
    until move_valid?(input) && move_appropriate?(input) && current_move_empty?(input[0].to_i, input[1].to_i)
      puts 'Try again move invalid'.colorize(:red)
      input = gets.chomp
    end
    [input[0].to_i, input[1].to_i]
  end

  def adjust_move(input, move_icon)
    x = input[0].to_i
    y = input[1].to_i
    x += 1 while x < 5
    x -= 1 until current_move_empty?(x, y)
    board.game_board[x][y] = move_icon
    updated_move(x, y, input)
    [x, y]
  end

  def current_move_empty?(x, y)
    board.game_board[x][y].match(' ')
  end

  def updated_move(x, y, input)
    puts "move adjusted from #{[input[0].to_i, input[1].to_i]} to #{[x, y]}"
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
