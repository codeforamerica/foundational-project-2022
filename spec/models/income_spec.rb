require 'rails_helper'

RSpec.describe Income, type: :model do
  let!(:bennie_app){BenefitsApp.create(email_address:'some@email.com')}
  let!(:income){bennie_app.incomes.create(pay_period:'Monthly', income:10000)}

  it "saves has_income for the Benefits App as true" do
    expect(bennie_app.has_income).to eq(true)
  end

  it "saves total income based off pay period" do
    expect(income.total_income).to eq(10000)
  end

  it "save qualifier as false" do
    expect(income.qualify).to eq(false)
  end
end
