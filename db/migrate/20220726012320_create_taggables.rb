class CreateTaggables < ActiveRecord::Migration[7.0]
  def change
    create_table :taggables do |t|
      t.references :task, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
