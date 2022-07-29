require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'is valid with valid attributes' do
    task = Task.new(title: 'Test', status: 'to_do', level: 1, deadline: Time.now, user_id: 1)
    expect(task).to be_valid
  end

  it 'is not valid without a title' do
    task = Task.new(title: nil, status: 'to_do', level: 1, deadline: Time.now, user_id: 1)
    expect(task).to_not be_valid
  end

  it 'is not valid without a user_id' do
    task = Task.new(title: 'Test', status: 'to_do', level: 1, deadline: Time.now, user_id: nil)
    expect(task).to_not be_valid
  end

  it "is not valid with status different from 'to_do' or 'done'" do
    task = Task.new(title: 'Test', status: 'pending', level: 1, deadline: Time.now, user_id: 1)
    expect(task).to_not be_valid
  end

  it 'is not valid with levels not between 1 and 5' do
    task = Task.new(title: 'Test', status: 'to_do', level: 6, deadline: Time.now, user_id: 1)
    expect(task).to_not be_valid
  end

  it 'is not valid with deadline not a date' do
    task = Task.new(title: 'Test', status: 'to_do', level: 1, deadline: 'not a date', user_id: 1)
    expect(task).to_not be_valid
  end

  it 'is not valid with user_id not an integer' do
    task = Task.new(title: 'Test', status: 'to_do', level: 1, deadline: Time.now, user_id: 'Foo')
    expect(task).to_not be_valid
  end
end
