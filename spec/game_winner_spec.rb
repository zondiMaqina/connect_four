# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/game_structure/game_winner'

# These tests test each searching algorithm depending on which move the saeching algorithms start to search from 1st or last

RSpec.describe GameWinner do
  subject(:game_win) { described_class.new }
  let(:game_board) { Array.new(6) { Array.new(7, ' ') } }
  let(:player_move) { "\u25A0" }

  describe '#search_down' do
    context 'when player has four connected moves downwards' do
      before do
        # all played moves
        [0, 1, 2, 3, 4].each do |x|
          game_board[x][0] = player_move
        end
      end

      it 'will make player win' do
        move = '00'
        expect(game_win).to receive(:player_wins)
        game_win.search_down(game_board, move)
      end
    end
  end

  describe '#search_up' do
    context 'when player has four connected moves upwards' do
      before do
        x_played_moves = [4, 3, 2, 1, 0]
        x_played_moves.each do |x|
          game_board[x][0] = player_move
        end
      end

      it 'will make player win' do
        move = '40'
        expect(game_win).to receive(:player_wins)
        game_win.search_up(game_board, move)
      end
    end
  end

  describe '#search_left' do
    context 'when player has 4 connected  moves to left' do
      before do
        y_played_moves = [1, 2, 3, 4]
        y_played_moves.each do |y|
          game_board[0][y] = player_move
        end
      end

      it 'will make player win' do
        move = '04'
        expect(game_win).to receive(:player_wins)
        game_win.search_left(game_board, move)
      end
    end
  end

  describe '#searh_right' do
    context 'when player has 4 connected moves to right' do
      before do
        y_played_moves = [1, 2, 3, 4]
        y_played_moves.each do |y|
          game_board[0][y] = player_move
        end
      end

      it ' will make player win' do
        move = '01'
        expect(game_win).to receive(:player_wins)
        game_win.search_right(game_board, move)
      end
    end
  end

  describe '#search_digonally_right_up' do
    context 'when player has 4 moves connected diagonally' do
      before do
        y_played_moves = [0, 1, 2, 3, 4] # 40 31 22 13 04
        y_played_moves.each do |y|
          game_board[4 - y][y] = player_move
        end
      end

      it 'will make player win' do
        move = '40'
        expect(game_win).to receive(:player_wins)
        game_win.search_diagonally_right_up(game_board, move)
      end
    end
  end

  describe '#search_digonally_right_down' do
    context 'when player has 4 moves connected diagonally' do
      before do
        played_moves = [0, 1, 2, 3, 4]
        played_moves.each { |move| game_board[move][move] = player_move }
      end

      it 'will make player win' do
        move = '00'
        expect(game_win).to receive(:player_wins)
        game_win.search_diagonally_right_down(game_board, move)
      end
    end
  end

  describe '#search_digonally_left_up' do
    context 'when player has 4 moves connected diagonally' do
      before do
        played_moves = [4, 3, 2, 1]
        played_moves.each { |move| game_board[move][move] = player_move }
      end

      it 'will make player win' do
        move = '44'
        expect(game_win).to receive(:player_wins)
        game_win.search_diagonally_left_up(game_board, move)
      end
    end
  end

  describe '#search_digonally_left_down' do
    context 'when player has 4 moves connected diagonally' do
      before do
        y_moves = [4, 3, 2, 1]
        x_moves = [0, 1, 2, 3]
        x_moves.each do |move|
          game_board[move][y_moves[move]] = player_move
        end
      end

      it 'will make player win' do
        move = '04'
        expect(game_win).to receive(:player_wins)
        game_win.search_diagonally_left_down(game_board, move)
      end
    end
  end
end
