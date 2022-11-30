class ChangeIncomeToBeStringInIncomes < ActiveRecord::Migration[7.0]
  def change
    change_column :incomes, :income, :string
  end
end
