class SignaturesController < ApplicationController
  def edit
    @benefits_app = BenefitsApp.find(params[:id])
  end

  def update
    @benefits_app = BenefitsApp.find(params[:id])

    if @benefits_app.update(benefits_app_params)
      @benefits_app.update_date_of_submission
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def benefits_app_params
    params.require(:benefits_app).permit(:benefits_app_id, :email_address, :signature)
  end
end

