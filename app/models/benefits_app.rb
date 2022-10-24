class BenefitsApp < ApplicationRecord
  has_many :members, dependent: :destroy
  validates :email_address, :format => { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email address"}
  # validates_presence_of :email_address, message: 'This field is required'
  def update_date_of_submission
    update(date_of_submission: DateTime.now)
  end
end
