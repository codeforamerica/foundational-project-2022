class AddHasIncomeToBenefitsApp < ActiveRecord::Migration[7.0]
  def change
    add_column :benefits_apps, :has_income, :boolean
  end
end
