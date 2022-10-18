class BenefitsApp < ApplicationRecord
  has_many :members

  def update_date_of_submission
    update(date_of_submission: DateTime.now)
  end
end
