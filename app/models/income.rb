class Income < ApplicationRecord
  belongs_to :benefits_app
  after_create :calculate_total_income
  after_create :do_you_qualify

  private
  def calculate_total_income
    benefits_app.update(has_income: true)
    if self.pay_period == 'Monthly'
      incomes_int = self.income.to_f
      self.total_income = incomes_int
    else
      incomes_int = self.income.to_f
      self.total_income = incomes_int * 2
    end
  end

  def do_you_qualify
    if self.total_income < 1000
      self.qualify =  true
    else
      self.qualify =  false
    end
  end
end
