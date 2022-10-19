class Member < ApplicationRecord
  before_create :member_primary_or_secondary
  belongs_to :benefits_app

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
