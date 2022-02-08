require '../../../studio_game/lib/studio_game/clumsy_player'
require_relative '../spec_helper'

module StudioGame
  describe ClumsyPlayer do
    before do
      @player = ClumsyPlayer.new("klutz")
    end

    it "only gets half the point value for each treasure" do
      allow_any_instance_of(Dice).to receive(:simple_roll).and_return(3)
      @player.points.should == 0

      hammer = Treasure.new(:hammer, 50)
      @player.found_treasure(hammer)
      @player.found_treasure(hammer)
      @player.found_treasure(hammer)

      @player.points.should == 75

      crowbar = Treasure.new(:crowbar, 400)
      @player.found_treasure(crowbar)

      @player.points.should == 275

      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      yielded.should == [Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)]
    end

    it "only gets third the point value for each treasure" do
      allow_any_instance_of(Dice).to receive(:simple_roll).and_return(6)
      @player.points.should == 0

      hammer = Treasure.new(:hammer, 50)
      @player.found_treasure(hammer)
      @player.found_treasure(hammer)
      @player.found_treasure(hammer)

      hammer_points = (50 / 3) + (50 / 3) + (50 / 3)
      @player.points.should == hammer_points

      crowbar = Treasure.new(:crowbar, 400)
      @player.found_treasure(crowbar)

      crowbar_points = (400 / 3)
      @player.points.should == crowbar_points + hammer_points

      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      yielded.should == [Treasure.new(:hammer, hammer_points), Treasure.new(:crowbar, crowbar_points)]
    end
  end
end