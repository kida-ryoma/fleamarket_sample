class CreatePhoneNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :phone_numbers do |t|
      t.string :number, null: false, unique: true
      t.references :user, optioanl: true
      t.timestamps
    end
  end
end
