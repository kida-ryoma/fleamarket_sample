class CreateDeliveryDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_destinations do |t|
      t.string :delivery_family_name, null: false
      t.string :delivery_fisrt_name, null: false
      t.string :delivery_family_name_kana, null: false
      t.string :delivery_first_name_kana, null: false
      t.integer :delivery_phone_number
      t.integer :post_code, null: false
      t.string :prefecture_code, null: false
      t.integer :city, null:false
      t.string :house_number, null: false
      t.string :building_name
      t.references :user, optional: true
      t.timestamps
    end
  end
end
