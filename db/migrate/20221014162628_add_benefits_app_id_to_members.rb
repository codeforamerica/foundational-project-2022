class AddBenefitsAppIdToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :benefits_app_id, :integer
    add_index :members, :benefits_app_id
  end
end
