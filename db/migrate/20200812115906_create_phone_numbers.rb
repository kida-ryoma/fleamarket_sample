class CreatePhoneNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :phone_numbers do |t|
      t.integer :phone_number, null: false, unique: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
