require 'rails_helper'
#testing both validations and database updates

describe MembersController do
  let(:benefits_app){BenefitsApp.create(email_address:'some_email@email.com')}
  context '#create' do
    it 'creates members object when all field valid' do
      expect do
        benefits_app.members.create(first_name: 'First Name', last_name: 'Last Name', birthdate: '10/10/2000')
      end.to change { benefits_app.members.count }.by(1)
    end

    it 'does not make a member if birthdate is not in a valid format' do
      expect do
        benefits_app.members.create(first_name: 'First Name', last_name: 'Last Name', birthdate: '10/10/00')
      end.not_to change { benefits_app.members.count }
    end

    it 'does not make a member if first name is not inputted' do
      expect do
        benefits_app.members.create(last_name: 'Last Name', birthdate: '10/10/2000')
      end.not_to change { benefits_app.members.count }
    end

    it 'does not make a member if last name is not inputted' do
      expect do
        benefits_app.members.create(first_name: 'First Name', birthdate: '10/10/2000')
      end.not_to change { benefits_app.members.count }

    end
  end
end
