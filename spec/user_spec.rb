require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'test', email: 't@t.t') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name longer than 50 characters' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'is not valid with an invalid email' do
    subject.email = 'test'
    expect(subject).to_not be_valid
  end
end
