class AddQualifyColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :qualify, :boolean
  end
end
