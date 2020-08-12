class CreateDeliveryResponsibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_responsibilities do |t|
      t.string :delivery_responsibility, null: false
      t.timestamps
    end
  end
end
