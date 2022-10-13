class CreateBenefitsApps < ActiveRecord::Migration[7.0]
  def change
    create_table :benefits_apps do |t|

      t.timestamps
    end
  end
end
