require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  it "is not valid without a product_id" do
    order = ProductOrder.new(order_id: 1, quantity: 10)
    expect(order).to_not be_valid
  end

  it "is not valid without a order_id" do
    order = ProductOrder.new(product_id: 1, quantity: 10)
    expect(order).to_not be_valid
  end

  it "is not valid without a :quantity" do
    order = ProductOrder.new(order_id: 1, product_id: 2)
    expect(order).to_not be_valid
  end

  it 'is invalid with a negative quantity' do
    product = ProductOrder.new(order_id: 1, product_id: 2, quantity: -1)
    expect(product).to_not be_valid
    expect(product.errors[:quantity]).to include("must be greater than or equal to 0")
  end
  
end
