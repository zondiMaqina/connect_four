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
end
