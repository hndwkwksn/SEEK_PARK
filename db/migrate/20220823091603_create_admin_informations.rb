class CreateAdminInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_informations do |t|
      t.text :information, null: false

      t.timestamps
    end
  end
end
