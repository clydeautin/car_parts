class RenameTypeInCars < ActiveRecord::Migration[7.1]
  def change
    rename_column :cars, :type, :category
  end
end
