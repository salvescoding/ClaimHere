class CompaniesController < ApplicationController
  before_action :set_company, except: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
   @complaints = Complaint.all.where(company: @company)
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
    params.require(:company).permit(:name, :location, :category)
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def set_user
    @user = current_user
  end

end
