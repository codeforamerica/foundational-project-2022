class BenefitsAppController < ApplicationController

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
    @benefits_app = BenefitsApp.new

    if @benefits_app.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end
end

