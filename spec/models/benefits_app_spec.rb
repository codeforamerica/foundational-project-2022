require 'rails_helper'

#testing the association
describe BenefitsApp do
  it "associations: should have many members" do
    t = BenefitsApp.reflect_on_association(:members)
    expect(t.macro).to eq(:has_many)
  end
end