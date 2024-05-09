class AddModelYearToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :model_year, :string
  end
end
