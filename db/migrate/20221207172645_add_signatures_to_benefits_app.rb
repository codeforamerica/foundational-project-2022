class AddSignaturesToBenefitsApp < ActiveRecord::Migration[7.0]
  def change
    add_column :benefits_apps, :signature, :string
  end
end
