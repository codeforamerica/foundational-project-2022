class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.boolean :primary_member
      t.boolean :secondary_member

      t.timestamps
    end
  end
end
