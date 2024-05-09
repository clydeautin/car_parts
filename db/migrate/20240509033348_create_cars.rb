class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :manufacturer
      t.string :model
      t.integer :base_msrp
      t.boolean :manual_option
      t.timestamps
    end
  end
end
