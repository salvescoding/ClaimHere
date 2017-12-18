class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :find]
  skip_before_action :authenticate_user!, only: [:index, :show, :find]

  def show
   @complaints = Complaint.all.where(company: @company)
  end

  def find
    @company = Company.find_by(domain: params[:domain])

    if Company.find_by(domain: params[:domain])
      redirect_to company_path(@company)
    else
      render :find
    end

  end

   def index

   end

  private

  def company_params
    params.require(:company).permit(:name, :location, :category, :domain, :logo)
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def set_user
    @user = current_user
  end

end
