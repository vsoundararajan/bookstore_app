class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :zip_code
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
