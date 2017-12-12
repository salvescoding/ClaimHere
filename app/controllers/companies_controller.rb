class CompaniesController < ApplicationController
  before_action :set_company

  def show
   @complaints = Complaint.all.where(company: @company)
   @complaint = Complaint.new
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
