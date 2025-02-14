# frozen_string_literal: true

# class for searching 4 connected moves for win
class GameWinner
  def initialize
    @player_attempts = []
  end

  def search_down(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    move = board[x][y]
    until index_valid?(board, x, y, move)
      @player_attempts << board[x][y] if matches?(board[x][y], move)
      x += 1
    end
    return player_wins(move) if @player_attempts.size >= 4

    clear_attempts
  end

  def search_up(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    move = board[x][y]
    until index_valid?(board, x, y, move)
      @player_attempts << board[x][y] if matches?(board[x][y], move)
      x -= 1
    end
    return player_wins(move) if @player_attempts.size >= 4

    clear_attempts
  end

  def search_left(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    move = board[x][y]
    until index_valid?(board, x, y, move)
      @player_attempts << board[x][y] if matches?(board[x][y], move)
      y -= 1
    end
    return player_wins(move) if @player_attempts.size >= 4

    clear_attempts
  end

  def search_right(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    move = board[x][y]
    until index_valid?(board, x, y, move)
      @player_attempts << board[x][y] if matches?(board[x][y], move)
      y += 1
    end
    return player_wins(move) if @player_attempts.size >= 4

    clear_attempts
  end

  def search_diagonally_right_up(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    move = board[x][y]
    until index_valid?(board, x, y, move)
      @player_attempts << board[x][y] if matches?(board[x][y], move)
      x -= 1
      y += 1
    end
    p @player_attempts
    p board
    return player_wins(move) if @player_attempts.size >= 4

    clear_attempts
  end

  def search_diagonally_right_down(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    move = board[x][y]
    until index_valid?(board, x, y, move)
      @player_attempts << board[x][y] if matches?(board[x][y], move)
      x
    end
    return player_wins(move) if @player_attempts.size >= 4

    clear_attempts
  end

  def index_valid?(board, x, y, move)
    x.negative? || y.negative? || board[x][y] != move
  end

  def matches?(current_position, player_move)
    current_position == player_move
  end

  def clear_attempts
    @player_attempts = []
  end

  def player_wins(move)
    puts "#{move} wins".colorize(:green)
    exit
  end
end
