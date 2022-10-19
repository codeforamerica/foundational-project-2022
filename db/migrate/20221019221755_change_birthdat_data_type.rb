class ChangeBirthdatDataType < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :birthdate, :date
    add_column :members, :birthdate, :string
  end
end
