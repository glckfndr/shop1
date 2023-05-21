require 'rails_helper'

RSpec.describe Product, type: :model do
  
  it "is not valid without a name" do
    product = Product.new(price: 10)
    expect(product).to_not be_valid
  end

  it "is not valid without a price" do
    product = Product.new(name: "Test product")
    expect(product).to_not be_valid
  end

  it "should be valid with a name and price" do
    product = Product.new(name: "Test product", price: 10)
    expect(product).to be_valid
  end
  
  it 'should be invalid with a negative price' do
    product = Product.new(
      name: 'Example Product',
      description: 'This is an example product',
      price: -9.99)
    #expect(product).to_not be_valid
    expect(product.errors[:price]).to include("must be greater than or equal to 0")
  end




end
