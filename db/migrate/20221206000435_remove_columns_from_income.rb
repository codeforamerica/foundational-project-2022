class RemoveColumnsFromIncome < ActiveRecord::Migration[7.0]
  def change
    remove_column :incomes, :has_income, :boolean
    remove_column :incomes, :income_biweekly, :boolean
    remove_column :incomes, :income_monthly, :boolean
  end
end
