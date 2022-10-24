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


    if @member.save
      redirect_to new_benefits_app_member_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @member = @benefits_app.members.find(params[:id])
  end

  def update
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @member = @benefits_app.members.find(params[:id])

    if @member.update(member_params)
      redirect_to new_benefits_app_member_path
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @member = @benefits_app.members.find(params[:id])
    @member.destroy
    redirect_to new_benefits_app_member_path, status: :see_other

  end

  private
  def member_params
    params.require(:member).permit(:first_name, :last_name, :birthdate, :primary_member, :secondary_member, :benefits_app_id)
  end

end
