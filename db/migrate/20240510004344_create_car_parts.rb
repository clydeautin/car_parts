class CreateCarParts < ActiveRecord::Migration[7.1]
  def change
    create_table :car_parts do |t|
      t.string :category
      t.string :manuf_country
      t.integer :price
      t.string :weight_lb
      t.string :float
      t.string :manuf
      t.string :primary_material
      t.boolean :oem
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
