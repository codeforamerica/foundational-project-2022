class IncomesController < ApplicationController
  def new
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.new
  end

  def create
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.create(income_params)
    puts "hellooooooooo"

    if @income.save
      redirect_to edit_benefits_app_income_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def index

  end
  # def show
  #
  # end

  def edit

  end

  def yes
    # redirect_to benefits_app_income_path
  end

  def employed
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.create(income_params)
  end

  def income_params
    params.require(:income).permit(:has_income, :income, :income_biweekly, :income_monthly, :total_income)
  end
end
