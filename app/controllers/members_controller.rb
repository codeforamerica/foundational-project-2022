class MembersController < ApplicationController
  def index
    @members = Member.all
  end
  def new
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @member = @benefits_app.members.new
  end


  def create
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @members_of_app = Member.all.group_by(&:benefits_app_id)
    @member = @benefits_app.members.create(member_params)
    @benefits_app.update_date_of_submission


    redirect_to root_path

    # if @member.save
    #   redirect_to @member
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private
  def member_params
    params.require(:member).permit(:first_name, :last_name, :birthdate, :primary_member, :secondary_member, :benefits_app_id)
  end

end
