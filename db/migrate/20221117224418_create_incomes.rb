class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.boolean :has_income
      t.integer :income
      t.boolean :income_biweekly
      t.boolean :income_monthly
      t.integer :total_income
      t.references :benefits_app, null: false, foreign_key: true

      t.timestamps
    end
  end
end
