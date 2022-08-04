class CreateParkTags < ActiveRecord::Migration[6.1]
  def change
    create_table :park_tags do |t|
      t.integer :park_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
