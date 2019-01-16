require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:barfi) { Dessert.new("barfi", 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(barfi.type).to eq("barfi")
    end

    it "sets a quantity" do
      expect(barfi.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(barfi.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("jamun", "fifty", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(barfi.ingredients << "sugar").to eq(["sugar"])
    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["sugar", "eggs", "flour"]
      ingredients.each do |ing|
        barfi.add_ingredient(ing)
      end
      expect(barfi.ingredients).to eq(ingredients)
      barfi.mix!
      expect(barfi.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(barfi.eat(5)).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {barfi.eat(100)}.to raise_error("not enough left!")
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(barfi.serve).to receive(:titleine).and_return
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do

      expect(chef).to receive(:bake).with(barfi)
      barfi.make_more
    end
  end

end
