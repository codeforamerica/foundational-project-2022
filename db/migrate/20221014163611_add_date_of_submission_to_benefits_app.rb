class AddDateOfSubmissionToBenefitsApp < ActiveRecord::Migration[7.0]
  def change
    add_column :benefits_apps, :date_of_submission, :date
  end
end
