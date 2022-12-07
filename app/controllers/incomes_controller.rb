class IncomesController < ApplicationController
  def new
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.new
  end

  def index
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.last
  end

  def show
  #   @benefits_app = BenefitsApp.find(params[:benefits_app_id])
  #   @income = @benefits_app.incomes.find(params[:id])
  end

  def you_qualify
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    # @income = @benefits_app.incomes.find(params[:id])
  end

  def you_do_not_qualify
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.find(params[:id])
  end

  def create
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.create(income_params)

    if @income.save
      redirect_to benefits_app_incomes_path(@benefits_app)
      # if true
      #   redirect_to you_qualify_benefits_app_path(@benefits_app)
      # else
      #   redirect_to you_do_not_qualify_benefits_app_path(@benefits_app)
      # end
    else
      render :new, status: :unprocessable_entity
    end

  end

  def income_params
    params.require(:income).permit(:pay_period, :income, :total_income, :benefits_app_id)
  end
end
