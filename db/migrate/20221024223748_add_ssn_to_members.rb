class AddSsnToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :ssn, :string
  end
end
