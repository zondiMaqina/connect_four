# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/game_structure/game_board'
# test does not test the literal gem but tests if no errors are received

RSpec.describe GameBoard do
  # initialie => assigns objects to avriables
  subject(:board) { described_class.new }

  describe '#print_game_board' do
    context 'when game board is printed' do
      it 'will show it as table' do
        expect(board).to receive(:puts)
        board.print_game_board
      end
    end
  end
end