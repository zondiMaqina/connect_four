#frozen_string_literal: true
require 'terminal-table'

# class for game's board
class GameBoard
  def initialize
    @game_board = Array.new(6) { Array.new(7, ' ')}
    @columns = [' ', 0, 1, 2, 3, 4, 5, 6]
  end

  def print_game_board
    game_board = Terminal::Table.new do |board|
      board.add_row @columns # boards columns
      board.add_separator
      @game_board.each_with_index do |row, index|
        board.add_row [index, row].flatten # 2D array
        board.add_separator if index < 5
      end
    end
    # convertion of @game_board to literal board
    puts game_board
  end
end
