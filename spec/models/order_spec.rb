require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:valid_order) { Order.new(firstname: "Oleh", lastname: "Bulanchuk", address: "Lisova 12/13", phone: "0967856660") }
  let(:invalid_order) { Order.new }

  it "is not valid without a firstname" do
    invalid_order.firstname = "Oleh"
    expect(invalid_order).to_not be_valid
  end

  it "is not valid without a lastname" do
    invalid_order.lastname = "Bulanchuk"
    expect(invalid_order).to_not be_valid
  end

  it "is not valid without an address" do
    invalid_order.address = "Lisova 12/13"
    expect(invalid_order).to_not be_valid
  end

  it "is not valid without a phone" do
    invalid_order.phone = "0967856660"
    expect(invalid_order).to_not be_valid
  end

  it "is valid with a firstname, lastname, address, and phone" do
    expect(valid_order).to be_valid
  end
end
