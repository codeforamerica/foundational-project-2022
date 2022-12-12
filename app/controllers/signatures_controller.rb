class SignaturesController < ApplicationController
  def edit
    @benefits_app = BenefitsApp.find(params[:id])
  end

  def update
    # When a controller action runs, Rails has set up a params value that is the
    # data submitted to this page from this request.
    #
    # Extra info, feel free to ignore: That can come from a form submission or the query string,
    # and it also includes some data Rails thinks you might want that the user didn't specifically submit.
    @benefits_app = BenefitsApp.find(params[:id])
    puts "======================= #{params}"
    if @benefits_app.update(benefits_app_params)
      @benefits_app.update_date_of_submission
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def benefits_app_params
    # params.permit(:benefits_app_id, :email_address, :signature)
    params.require(:benefits_app).permit( :id, :benefits_app_id, :email_address, :signature)
    # sample input/output pair?
    # params = { "benefits_app": { id: 1, benefitsapp_id: 1 }, "user": {name: "New Name"} }
    # output = ... { id: 1}
  end
end

