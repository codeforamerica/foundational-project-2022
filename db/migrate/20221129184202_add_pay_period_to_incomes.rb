class AddPayPeriodToIncomes < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :pay_period, :string
  end
end
