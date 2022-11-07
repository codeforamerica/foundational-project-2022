require 'rails_helper'

RSpec.describe Member, :type => :model do
  context 'if new member is first member' do
    # let(:member) {Member.new}
    bennie_app = BenefitsApp.new(email_address: 'some@email.com')
    bennie_app.save
    member = bennie_app.members.create(birthdate: "12/12/2002", first_name: "name", last_name: "last")
    member2 = bennie_app.members.create(birthdate: "12/12/2022", first_name: "name2", last_name: "last2")
    it 'sets primary_member to true' do
      expect(member.primary_member).to eq(true)
    end

    it 'sets primary_member to false for subsequent members' do
      expect(member2.primary_member).to eq(false)
    end
  end
end
