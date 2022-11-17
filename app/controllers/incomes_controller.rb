class IncomesController < ApplicationController
  def new
    @benefits_app = BenefitsApp.find(params[:benefits_app_id])
    @income = @benefits_app.incomes.new
  end
end
