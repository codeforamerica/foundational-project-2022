require 'rails_helper'

describe SignaturesController do
  let!(:benefits_app){BenefitsApp.create!(email_address:'some_email@email.com')}
  let(:params) { {id: benefits_app.id, signature: signature} }
  let(:signature) { "Joe Smith" }
  context 'signature is entered and submit its pressed' do
    it 'saves signature and reroutes to route page' do
      expect(patch :update, params: params).to redirect_to(root_path)
      expect(assigns(:benefits_app).signature).to eq("Joe Smith")
    end
  end
end
