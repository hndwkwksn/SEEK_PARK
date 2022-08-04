class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.integer :end_user_id, null: false
      t.string :name, null: false, default: ""
      t.text :introduction, null: false, default: ""
      t.text :address, null: false, default: ""

      t.timestamps
    end
  end
end
