require 'rails_helper'

RSpec.describe Income, type: :model do
  let!(:bennie_app){BenefitsApp.create(email_address:'some@email.com')}
  let!(:income){bennie_app.incomes.create(pay_period:'Monthly', income:100)}
  it "saves total income based off pay period" do
    expect(income.total_income).to eq(1200)
  end
end
