class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :find]
  skip_before_action :authenticate_user!, only: [:index, :show, :find]

  def show
   @complaints = Complaint.all.where(company: @company)
  end

  def find
    @company = Company.find_by(domain: params[:domain])
    if params[:domain]
      redirect_to company_path(@company)
    else

    end

  end

   def index
    if params[:query]
     @companies = Company.where(name: params[:query].capitalize)
     if @companies.any?
      redirect_to company_path(@companies.first)
     else
      flash[:alert] = "This company does not exist"
      redirect_to root_path
     end
     else

     end
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
