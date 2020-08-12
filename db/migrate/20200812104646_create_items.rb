class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :size
      t.string :brand
      t.integer :sales_status, null: false
      t.integer :prefecture_code, null: false
      t.references :category,　foreign_key: true
      t.references :status,type: :bigint, foreign_key: true
      t.references :user, foreign_key: true
      t.references :delivery_responsibility, foreign_key: true
      t.references :preparation_day, foreign_key: true
      t.timestamps
    end
  end
end
