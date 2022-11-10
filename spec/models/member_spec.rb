require 'rails_helper'

#testing logic for primary and secondary members
RSpec.describe Member, :type => :model do
  context 'if new member is first member' do
    let!(:bennie_app){BenefitsApp.create(email_address:'some@email.com')}
    let!(:member1){bennie_app.members.create(birthdate: "12/12/2022", first_name: "name1", last_name: "last1")}
    let!(:member2){bennie_app.members.create(birthdate: "12/12/2022", first_name: "name2", last_name: "last2")}

    it 'sets primary_member to true' do
      expect(member1.primary_member).to eq(true)
    end

    it 'sets primary_member to false for subsequent members' do
      expect(member2.primary_member).to eq(false)
    end
  end
end

