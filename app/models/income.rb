class Income < ApplicationRecord
  after_create :calculate_total_income
  belongs_to :benefits_app

  private
  def calculate_total_income
    if self.pay_period == 'Monthly'
      self.total_income = self.income * 12
    else
      self.total_income = self.income * 26
    end
  end
end
