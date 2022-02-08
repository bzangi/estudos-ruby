require '../../../studio_game/lib/studio_game/treasure_trove'
require_relative '../spec_helper'

module StudioGame
  describe Treasure do

    before do
      @treasure = Treasure.new(:hammer, 50)
    end

    it "has a name attribute" do
      @treasure.name.should == :hammer
    end

    it "has a points attribute" do
      @treasure.points.should == 50
    end

  end

  describe TreasureTrove do

    it "has eleven different treasures" do
      TreasureTrove::TREASURES.size.should == 10
    end

    it "has a pie worth 5 points" do
      TreasureTrove::TREASURES[4].should == Treasure.new(:pie, 5)
    end

    it "has a bottle worth 25 points" do
      TreasureTrove::TREASURES[5].should == Treasure.new(:bottle, 25)
    end

    it "has a hammer worth 50 points" do
      TreasureTrove::TREASURES[6].should == Treasure.new(:hammer, 50)
    end

    it "has a skillet worth 100 points" do
      TreasureTrove::TREASURES[7].should == Treasure.new(:skillet, 100)
    end

    it "has a broomstick worth 200 points" do
      TreasureTrove::TREASURES[8].should == Treasure.new(:broomstick, 200)
    end

    it "has a crowbar worth 400 points" do
      TreasureTrove::TREASURES[9].should == Treasure.new(:crowbar, 400)
    end
  end
end