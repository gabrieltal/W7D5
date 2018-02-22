require 'rspec'
require 'rspec_exercise'

RSpec.describe Array do
  describe "#remove_dups" do

    it "removes duplicates" do
      expect([1, 3, 2, 1, 3, 3].my_uniq).to eq([1, 3, 2])
    end

    it "check elements are removed in order they appear" do
      expect([1, 3, 2, 1, 3, 3].my_uniq).to_not eq([1, 2, 3])
      expect([1, 3, 2, 1, 3, 3].my_uniq).to_not eq(nil)
    end
  end

  describe "#two_sum" do

    it "returns the correct positions" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end


    it "indexes are returned sorted" do
      solution = ([-1, 0, 2, -2, 1].two_sum)
      expect(solution).to eq(solution.sort)
    end
  end

  describe "#my_transpose" do
    it "correctly transposes an array" do
      expect([[0, 1, 2], [3, 4, 5], [6, 7, 8]].my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8],])
    end
  end

  describe "#stockpicker" do
    it "should output most profitable pair" do
      expect([100, 150, 50, 200, 50].stockpicker).to eq([2, 3])
    end
  end
end
