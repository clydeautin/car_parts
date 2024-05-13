class ChangeCategoryTypeInCars < ActiveRecord::Migration[7.1]
  def change
    change_column :cars, :category, :string
  end
end
