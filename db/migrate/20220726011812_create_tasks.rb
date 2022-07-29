class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :title, null: false
      t.string :status, default: "to_do"
      t.integer :level
      t.datetime :deadline
      t.references :user, null: false, foreign_key: true
    end
  end
end
