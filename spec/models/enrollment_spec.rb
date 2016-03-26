require_relative "../spec_helper"

describe Enrollment do
  describe 'associations' do
    before(:each) do
      @game   = Game.create!(name: "Assassins")
      @player = User.create!(first_name: "Susan Smith")
      @target = User.create!(first_name: "The Target")

      @enrollment = Enrollment.create!(user: player, game: game, target_id: @target.id)
    end

    it 'has a user' do
      expect(@enrollment.user).to eq(@player)
    end

    it 'has a game' do
      expect(@enrollment.game).to eq(@game)
    end

    it 'has a target' do
      expect(@enrollment.target).to eq(@target)
    end

  end
end