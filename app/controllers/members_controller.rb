class MembersController < ApplicationController
  def new
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @member = @benefits_app.members.new
  end

  def create
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @member = @benefits_app.members.create(members_params)
    redirect_to benefits_apps_path(@benefits_app)
  end

  private
  def members_params
    params.require(:member).permit(:first_name, :last_name, :birthdate, :primary_member, :secondary_member)
  end
end
