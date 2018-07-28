require 'rspec'
require 'towersofhanoi'
RSpec.describe TowersOfHanoi do
  let (:new_tower) { TowersOfHanoi.new}
  let (:winning_tower) { TowersOfHanoi.new([[], [], [3, 2, 1]]) }
  describe "#initialize" do
    it "creates array with starting discs" do
      expect(new_tower.tower).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#won?" do
    it "checks if the game is won" do
      expect(winning_tower).to be_won
    end
 end

  describe "#move" do
    a = TowersOfHanoi.new([[3, 2, 1], [], []])
    b = TowersOfHanoi.new([[3, 2], [1], []])

    it "checks that the move moved the disc to another array" do
      a.move(0, 1)
      expect(a.tower).to eq(b.tower)
    end

    it "checks if start array has dics" do
      #raise error if start tower has no discs
      expect{ a.move(2, 1) }.to raise_error("Start tower empty")
    end

    d = TowersOfHanoi.new([[3], [2], [1]])
    it "checks that the end array has a bigger disc" do
      #can be empty or tower[-1] > thing trying to put in it
      expect{ d.move(0, 2)}.to raise_error("Invalid move")
    end
  end
end
