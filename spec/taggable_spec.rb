require 'rails_helper'

RSpec.describe Taggable, :type => :model do

    it "is valid with valid attributes" do
        task = Task.new(title: "Test", status: "to_do", level: 1, deadline: Time.now, user_id: 1)
        task.save
        tag = Tag.new(name: "Test", user_id: 1)
        tag.save
        taggable = Taggable.new(tag_id: tag.id, task_id: task.id)
        expect(taggable).to be_valid
    end

    it "is not valid without an existing tag" do
        task = Task.new(title: "Test", status: "to_do", level: 1, deadline: Time.now, user_id: 1)
        task.save
        taggable = Taggable.new(tag_id: 0, task_id: task.id)
        expect(taggable).to_not be_valid
    end

    it "is not valid without an existing task" do
        tag = Tag.new(name: "Test", user_id: 1)
        tag.save
        taggable = Taggable.new(tag_id: tag.id, task_id: 0)
        expect(taggable).to_not be_valid
    end

    it "is not valid with tag_id not an integer" do
        task = Task.new(title: "Test", status: "to_do", level: 1, deadline: Time.now, user_id: 1)
        task.save
        taggable = Taggable.new(tag_id: "Foo", task_id: task.id)
        expect(taggable).to_not be_valid
    end

    it "is not valid with task_id not an integer" do
        tag = Tag.new(name: "Test", user_id: 1)
        tag.save
        taggable = Taggable.new(tag_id: tag.id, task_id: "Foo")
        expect(taggable).to_not be_valid
    end
end