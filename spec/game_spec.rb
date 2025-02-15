# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/game'

RSpec.describe Game do
  # initialize => assigns objects
  # start_agem => Public Script method
  # play_game => Public Script method
  # show_rules => prints only
  # verify_move => Conditional Public Script method
  subject(:player_input) { described_class.new }
  let(:player_details) { double('Players') }
  let(:players_name) { %w[player1 player2] }
  let(:player_move) { "\u25A0" }

  before do
    allow(player_input).to receive(:players_data).and_return(player_details)
    allow(player_details).to receive(:game_players).and_return(players_name[0])
    allow(player_details).to receive(:chosen_moves).and_return(player_move)
  end

  describe '#play_player1' do
    context 'when player enters an invaid move' do
      before do
        position = [2, 1]
        allow(player_input).to receive(:puts)
        allow(player_input).to receive(:verify_move).and_return(position)
      end

      it 'will be added to recorded moves as valid move' do
        expect { player_input.play_player1 }.to(change { player_input.player_one_moves })
      end
    end
  end

  describe '#play_player2' do
    context 'when player has entered input' do
      before do
        position = [2, 2]
        allow(player_input).to receive(:puts)
        allow(player_input).to receive(:verify_move).and_return(position)
      end

      it 'will be added to recorded moves' do
        expect { player_input.play_player2 }.to(change { player_input.player_two_moves })
      end
    end
  end

  describe '#move_valid?' do
    context 'when input has more than 3 characters' do
      it 'will return false' do
        input = 'abs'
        expect(player_input).not_to be_move_valid(input)
      end
    end

    context 'when input has 2 chars that are not integers' do
      it 'will return false' do
        input = 'ds'
        expect(player_input).not_to be_move_valid(input)
      end
    end

    context 'when input has 2 chars of integers' do
      it 'will return true' do
        input = '20'
        expect(player_input).to be_move_valid(input)
      end
    end
  end

  describe '#move_appropriate?' do
    context 'when input move is out of board scale' do
      it 'will return false' do
        input = '76'
        expect(player_input).not_to be_move_appropriate(input)
      end
    end

    context 'when input move is within board scale' do
      it 'will return true' do
        input = '56'
        expect(player_input).to be_move_appropriate(input)
      end
    end
  end

  describe '#try_again' do
  end
end
