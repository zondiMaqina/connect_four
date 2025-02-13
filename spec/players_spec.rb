#frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/players_data/players'

RSpec.describe Players do
  # #initialze => assigns objects to vars
  # #receive_players_data => Public Script method

  subject(:player_name) { described_class.new }

  describe '#receive_player1_name' do
    before do
      name = 'player1'
      allow(player_name).to receive(:gets).and_return(name)
      allow(player_name).to receive(:puts)
    end

    it "will store player's name" do
      saved_name = 'player1'
      expect{ player_name.receive_player1_name }.to change(player_name, :game_players).from([]).to([saved_name])
    end
  end

  describe '#receive_player1_name' do
    before do
      name = 'player2'
      allow(player_name).to receive(:gets).and_return(name)
      allow(player_name).to receive(:puts)
    end

    it "will store player's name" do
      saved_name = 'player2'
      expect{ player_name.receive_player1_name }.to change(player_name, :game_players).from([]).to([saved_name])
    end
  end
end