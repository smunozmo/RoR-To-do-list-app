require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'is valid with valid attributes' do
    tag = Tag.new(name: 'Test', user_id: 1)
    expect(tag).to be_valid
  end

  it 'is not valid without a name' do
    tag = Tag.new(name: nil, user_id: 1)
    expect(tag).to_not be_valid
  end

  it 'is not valid without a user_id' do
    tag = Tag.new(name: 'Test', user_id: nil)
    expect(tag).to_not be_valid
  end

  it 'is not valid with user_id not an integer' do
    tag = Tag.new(name: 'Test', user_id: 'not an integer')
    expect(tag).to_not be_valid
  end

  it 'is not valid with a duplicate name' do
    tag = Tag.new(name: 'Test', user_id: 1)
    tag.save
    tag2 = Tag.new(name: 'Test', user_id: 1)
    expect(tag2).to_not be_valid
  end

  it 'is not valid with user_id not an integer' do
    tag = Tag.new(name: 'Test', user_id: 'Foo')
    expect(tag).to_not be_valid
  end
end
