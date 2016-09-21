require 'rspec'
require 'hanoi'

# play method hanoi should receive move with(Integer) with(Integer)

RSpec::Matchers.define :a_valid_tower do
  match { |actual| (0..2).cover?(actual)}
end

describe TowersOfHanoi do
  let(:hanoi){TowersOfHanoi.new}

  context "#initialize" do
    it "should initialize with three towers" do
      expect(hanoi.towers.length).to eq(3)
    end

    it "should initialize with first tower full" do
      expect(hanoi.towers[0].length).to eq(3)
      expect(hanoi.towers[1]).to be_empty
      expect(hanoi.towers[2]).to be_empty
    end
  end

  context "#move" do

    it "should receive two valid towers" do
      expect(hanoi).to receive(:move).with(a_valid_tower, a_valid_tower)
      hanoi.move(0,1)
    end

    it "should pick from a tower with at least one disk" do
      expect{hanoi.move(1,2)}.to raise_error("You must choose a tower with at least one disc")
    end

    it "should move properly" do
      hanoi.move(0,1)
      expect(hanoi.towers[0].length).to eq(2)
      expect(hanoi.towers[1].length).to eq(1)
    end

    it "should not move a greater disk on top of a smaller one" do
      hanoi.move(0,1)
      expect{hanoi.move(0,1)}.to raise_error("You can't move a large disc on top of a smaller one")
    end
  end

  context "#won" do

    it "should be true if there are two empty towers and one full towers" do
      hanoi.towers.rotate!
      expect(hanoi.won?).to eq(true)
    end

    it "should only be true if full tower is not the starting tower" do
      expect(hanoi.won?).to eq(false)
      hanoi.towers.rotate!
      expect(hanoi.won?).to eq(true)
    end
  end


end
