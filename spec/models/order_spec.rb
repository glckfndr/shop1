require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is not valid without a firstname" do
    order = Order.new(firstname: "Oleh")
    expect(order).to_not be_valid
  end

  it "is not valid without a lastname" do
    order = Order.new(lastname: "Bulanchuk")
    expect(order).to_not be_valid
  end

  it "is not valid without a address" do
    order = Order.new(firstname: "Oleh", lastname: "Bulanchuk")
    expect(order).to_not be_valid
  end

  it "is not valid without a phone" do
    order = Order.new(firstname: "Oleh", lastname: "Bulanchuk", address: "Lisova 12/13")
    expect(order).to_not be_valid
  end

  it "is valid with a firstname, lastname, address, phone" do
    order = Order.new(firstname: "Oleh", lastname: "Bulanchuk", address: "Lisova 12/13", phone: "0967856660")
    expect(order).to be_valid
  end
end
