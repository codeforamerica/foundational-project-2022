class RemoveDateOfSubmission < ActiveRecord::Migration[7.0]
  def change
    remove_column :benefits_apps, :date_of_submission, :date
    add_column :benefits_apps, :date_of_submission, :datetime
  end
end
