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
end
