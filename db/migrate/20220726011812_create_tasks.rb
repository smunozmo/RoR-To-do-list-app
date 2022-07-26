class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :title, null: false
      t.string :status, default: "to_do", null: false
      t.integer :level, null: false
      t.datetime :deadline, null: false
      t.references :user, null: false, foreign_key: true
    end
  end
end
