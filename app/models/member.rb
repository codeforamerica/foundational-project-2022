class Member < ApplicationRecord
  before_create :member_primary_or_secondary
  belongs_to :benefits_app


  validates :birthdate, :format => { with: /\A\d{2}\/\d{2}\/\d{4}\z/, message: "Please use the date format (mm/dd/yyyy)" }
  validates_presence_of :first_name, :last_name, message: 'This field is required'

  encrypts :ssn, deterministic: true

  private
  def member_primary_or_secondary
    if benefits_app.members.count == 0
      self.primary_member = true
      self.secondary_member = false
    else
      self.primary_member = false
      self.secondary_member = true
    end
  end
end
