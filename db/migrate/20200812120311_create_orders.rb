class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :item, foreign_key: true
      t.references :seller, foreign_key: {to_table: :users}, null: false
      t.references :buyer, foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
