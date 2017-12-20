class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :find]
  skip_before_action :authenticate_user!, only: [:index, :show, :find]

  def show
   @complaints = Complaint.all.where(company: @company).paginate(page: params[:page], per_page: 5)
  end

  def find
    @company = Company.new(name: params[:name], domain: params[:domain], logo: params[:logo])
    @company.save
    if Company.find_by(domain: params[:domain])
      redirect_to company_path(@company)
    else
      render :root
      flash[:notice] = "We could not find this company!"
    end
  end

   def index

   end

  private

  def company_params
    params.require(:company).permit(:name, :location, :domain, :logo)
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def set_user
    @user = current_user
  end



end



