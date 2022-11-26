require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.create(name: 'testfood', measurement_unit: 'gram', price: 10, user_id: 1)
  end

  before { subject.save }

  it 'is not valid without a measurement unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a price less than 0' do
    subject.price = -1
    expect(subject).to_not be_valid
  end
end
