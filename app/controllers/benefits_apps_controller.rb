class BenefitsAppsController < ApplicationController

  def index


    @benefits_apps = BenefitsApp.all

  end

  def show
    @benefits_app = BenefitsApp.find(params[:id])
  end

  def new
    @benefits_app = BenefitsApp.new
  end

  def create
    @benefits_app = BenefitsApp.new(benefits_app_params)

    if @benefits_app.save
      redirect_to new_benefits_app_member_path(@benefits_app)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update_date
    @benefits_app = BenefitsApp.find(params[:id])
    @benefits_app.update_date_of_submission
    redirect_to root_path

  end

  private
    def benefits_app_params
      params.require(:benefits_app).permit(:address, :phone_number, :email_address, :benefits_app_id)
    end
end
