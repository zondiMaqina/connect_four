# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/game_structure/game_winner'

# These tests test each searching algorithm depending on which direction the player has played with 4 moves, starting from the last made

RSpec.describe GameWinner do
  subject(:game_win) { described_class.new }
  let(:game_board) { Array.new(6) { Array.new(7, ' ')} }
  let(:player_move) { "\u25A0" }
  describe '#search_up' do
    context 'when player has four connected moves up' do
      before do
        # all played moves
        [0, 1, 2, 3, 4].each do |x|
          game_board[x][0] = player_move
        end
      end

      it 'will make player win' do
        expect(game_win).to receive(:player_wins)
        game_win.search_up(game_board, player_move)
      end
    end
  end
end