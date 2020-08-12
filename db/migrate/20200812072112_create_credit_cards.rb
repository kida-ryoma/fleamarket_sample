class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.integer :cutomer_id, null: false
      t.integer :card_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
