require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:valid_product) { Product.new(name: "Test product", price: 10) }
  let(:invalid_product) { Product.new }
  
  it "is not valid without a name" do
    invalid_product.price = 10
    expect(invalid_product).to_not be_valid
  end

  it "is not valid without a price" do
    invalid_product.name = "Test product"
    expect(invalid_product).to_not be_valid
  end

  it "is valid with a name and price" do
    expect(valid_product).to be_valid
  end
  
  it 'is invalid with a negative price' do
    valid_product.price  =  - 1.1
    expect(valid_product).to_not be_valid
    expect(valid_product.errors[:price]).to include("must be greater than or equal to 0")
  end
end
