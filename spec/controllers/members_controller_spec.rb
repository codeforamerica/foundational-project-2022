require 'rails_helper'
#testing both validations and database updates

describe MembersController do
  let(:benefits_app){BenefitsApp.create(email_address:'some_email@email.com')}
  context '#create' do
    it 'creates members object when all field valid' do
      members_before = benefits_app.members.count
      benefits_app.members.create(first_name: 'First Name', last_name: 'Last Name', birthdate: '10/10/2000')
      members_after = benefits_app.members.count
      expect(members_after).to eq(members_before + 1)
    end
  end

  it 'does not make a member if birthdate is not in a valid format' do
    members_before = benefits_app.members.count
    benefits_app.members.create(first_name: 'First Name', last_name: 'Last Name', birthdate: '10/10/00')
    members_after = benefits_app.members.count
    expect(members_after).to eq(members_before)
  end

  it 'does not make a member if first name is not inputted' do
    members_before = benefits_app.members.count
    benefits_app.members.create(last_name: 'Last Name', birthdate: '10/10/2000')
    members_after = benefits_app.members.count
    expect(members_after).to eq(members_before)
  end

  it 'does not make a member if last name is not inputted' do
    members_before = benefits_app.members.count
    benefits_app.members.create(first_name: 'First Name', birthdate: '10/10/2000')
    members_after = benefits_app.members.count
    expect(members_after).to eq(members_before)
  end
end
