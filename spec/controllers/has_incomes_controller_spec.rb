require 'rails_helper'

describe HasIncomesController do

  describe '#update' do
    let!(:benefits_app){BenefitsApp.create!(email_address:'some_email@email.com')}
    let(:params) { {id: benefits_app.id, has_income: has_income} }
    let(:has_income) { "yes" }
    context 'when has_income param is true' do
      render_views
      it 'saves has_income to true and redirects to new ' do
        expect(patch :update, params: params).to redirect_to(new_benefits_app_income_path(benefits_app))
        expect(assigns(:benefits_app).has_income).to eq(true)

      end
    end

    context 'when has_income param is no' do
      let(:has_income) { "no" }
      it 'saves has_income to false and redirects to edit page' do
        expect(patch :update, params: params).to redirect_to(edit_signature_path)
        expect(assigns(:benefits_app).has_income).to eq(false)
      end
    end
  end
end
