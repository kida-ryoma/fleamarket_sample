class CreatePreparationDays < ActiveRecord::Migration[6.0]
  def change
    create_table :preparation_days do |t|
      t.string :days, null: false
      t.timestamps
    end
  end
end
