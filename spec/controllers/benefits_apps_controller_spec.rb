require 'rails_helper'

describe BenefitsAppsController do
  #testing both validations and database updates
  context '#create' do
    it 'creates benefit apps object when email address is in a valid format' do
      benefits_apps_before = BenefitsApp.count
      post :create, params: { benefits_app: { email_address: 'member@codeforamerica.org' } }
      benefits_apps_after = BenefitsApp.count
      expect(benefits_apps_after).to eq(benefits_apps_before + 1)
    end

    end

    it 'does not make benefits app if email address is not in a valid format' do
      benefits_apps_before = BenefitsApp.count
      post :create, params: { benefits_app: { email_address: 'member' } }
      benefits_apps_after = BenefitsApp.count

      # expect that the number of benefits apps objects does not change
      expect(benefits_apps_after).to eq(benefits_apps_before)
    end

  context '#not_employed' do
    let(:benefits_app){BenefitsApp.create(email_address:'some_email@email.com', id: 1)}
    before do
      routes.draw { get "benefits_apps/:id/not_employed" => "benefits_apps#not_employed", :as => "not_employed"}
    end

    it 'saves has_income to false when No is clicked' do
      get :benefits_apps/:id/not_employed
      expect(benefits_app.has_income).to eq(false)
    end
  end
end
