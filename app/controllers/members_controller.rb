class MembersController < ApplicationController
  def index
    @members = Member.all
  end
  def new
    @member = Member.new
  end

  def create
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @member = @benefits_app.members.create(members_params)
    redirect_to benefits_app_path(@benefits_app)

    # if @member.save
    #   redirect_to @member
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private
  def members_params
    params.require(:member).permit(:first_name, :last_name, :birthdate, :primary_member, :secondary_member, :benefits_app_id)
  end

end
