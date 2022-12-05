class IncomesController < ApplicationController
  def new
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.new
  end

  def create
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.create(income_params)

    if @income.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def income_params
    params.require(:income).permit(:pay_period, :has_income, :income, :income_biweekly, :income_monthly, :total_income, :benefits_app_id)
  end
end
