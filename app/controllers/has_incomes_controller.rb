class HasIncomesController < ApplicationController

  def edit
    @benefits_app = BenefitsApp.find(params[:id])
  end

  def update
    @benefits_app = BenefitsApp.find(params[:id])

      if params[:has_income] == "yes"
        @benefits_app.update!(has_income: true)
        redirect_to new_benefits_app_income_path(@benefits_app)
      elsif params[:has_income]=="no"
        @benefits_app.update!(has_income: false)
        redirect_to edit_has_income_path
      end
  end

end
