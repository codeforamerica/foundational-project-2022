class Income < ApplicationRecord
  belongs_to :benefits_app
  after_create :calculate_total_income

  private
  def calculate_total_income
    if self.pay_period == 'Monthly'
      incomes_int = self.income.to_f
      self.total_income = incomes_int * 12
    else
      incomes_int = self.income.to_f
      self.total_income = incomes_int * 26
    end
  end
end
