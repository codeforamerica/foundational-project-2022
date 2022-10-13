class AddColumnsToBenefitsApps < ActiveRecord::Migration[7.0]
  def change
    add_column :benefits_apps, :address, :string
    add_column :benefits_apps, :phone_number, :string
    add_column :benefits_apps, :email_address, :string
  end
end
