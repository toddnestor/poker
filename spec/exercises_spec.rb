require 'rspec'
require 'exercises'

describe Array do

  context "#my_uniq" do
    let(:array) {[1,1,1,2,3,4]}

    it "should return an array with no duplicates" do
      expect(array.my_uniq).to eq(array.uniq)
    end

    it "should not call #uniq" do
      expect(array).to_not receive(:uniq)
      array.my_uniq
    end
  end

  context "#two_sum" do
    let(:array) {[-1, 0, 2, -2, 1]}
    let(:array_no_pairs) {[1,2,3,4,5]}

    it "returns an array of index pairs that add to 0" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns an empty array if no pair is found" do
      expect(array_no_pairs.two_sum).to be_empty
    end

    it "should not return a pair of the same index" do
      expect(array.two_sum).to_not include([1,1])
    end
  end

  context "#my_transpose" do
    let(:rows) {[[0, 1, 2],[3, 4, 5],[6, 7, 8]]}
    let(:cols) {[[0, 3, 6],[1, 4, 7],[2, 5, 8]]}

    it "should transpose a 3x3 array of arrays" do
      expect(rows).to_not eq(cols)
      expect(rows.my_transpose).to eq(cols)
    end

    it "should maintain the lengths" do
      expect(rows.my_transpose.length).to eq(rows[0].length)
    end

    it "should not call #transpose" do
      expect(rows).to_not receive(:transpose)
      rows.my_transpose
    end
  end
end

describe "Stock Picker" do
  let(:stocks_1) {[100,99,98,97,102,105]}
  let(:stocks_2) {[99,98,102,105,97,100]}

  it "should return the most profitable pair of days" do
    expect(stock_picker(stocks_1)).to eq([3,5])
  end

  it "should not just return the lowest value with the highest value after it" do
    expect(stock_picker(stocks_2)).to be_an_instance_of(Array)
    expect(stock_picker(stocks_2)).to_not eq([4,5])
  end

end
