class ChangeAFewThingsLikeWeightAndFloat < ActiveRecord::Migration[7.1]
  def change
    change_column :car_parts, :weight_lb, :decimal, using: 'weight_lb::numeric'
    remove_column :car_parts, :float, :string
  end
end
