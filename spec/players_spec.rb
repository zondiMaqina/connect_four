#frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/players_data/players'

RSpec.describe Players do
  # #initialze => assigns objects to vars
  # #show_colors => only prints
  # show_players_details => prints data
  subject(:player_name) { described_class.new }

  describe '#receive_player1_name' do
    before do
      name = 'player1'
      allow(player_name).to receive(:gets).and_return(name)
      allow(player_name).to receive(:puts)
      allow(player_name).to receive(:choose_color)
    end

    it "will store player's name" do
      saved_name = 'player1'
      expect{ player_name.receive_player1_name }.to change(player_name, :game_players).from([]).to([saved_name])
    end
  end

  describe '#receive_player2_name' do
    before do
      name = 'player2'
      allow(player_name).to receive(:gets).and_return(name)
      allow(player_name).to receive(:puts)
      allow(player_name).to receive(:choose_color)
    end

    it "will store player's name" do
      saved_name = 'player2'
      expect{ player_name.receive_player1_name }.to change(player_name, :game_players).from([]).to([saved_name])
    end
  end

  subject(:player_color) { described_class.new }

  describe '#choose_color' do
    context 'when player chooses their color of choice' do
      before do
        chosen_color = 'green'
        allow(player_color).to receive(:chosen_color).and_return(chosen_color)
        allow(player_color).to receive(:puts)
      end
  
      it 'will let be saved to array' do
        expect{ player_color.choose_color }.to change{ player_color.chosen_moves }
      end
    end

    context 'when player has chosen color' do
      before do
        color = 'green'
        allow(player_color).to receive(:gets).and_return(color)
        allow(player_color).to receive(:puts)
      end

      it 'will be removed from available colors' do
        chosen_color = 'green'
        player_color.choose_color
        expect(player_color.available_colors).not_to include(chosen_color)
      end
    end
  end

  describe '#chosen_color' do
    context 'when player enters non-existant color' do
      before do
        invalid_color = 'gold'
        valid_color = 'green'
        allow(player_color).to receive(:gets).and_return(invalid_color, valid_color)
      end

      it 'will ask player to enter color again' do
        message = 'Color does not exist or already chosen'
        expect(player_color).to receive(:puts).with(message)
        player_color.chosen_color
      end
    end
  end
end