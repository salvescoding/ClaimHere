class ComplaintsController < ApplicationController
  before_action :set_company
  before_action :set_user
  skip_before_action :authenticate_user!, only: [:new, :create]

  def show
    @complaint = Complaint.find(params[:id])
  end

  def new
    @complaint = Complaint.new
    @companies = Company.all
  end

  def create
    cookies[:company_id] = @company.id
    cookies[:complaint] = complaint_params.to_json

    if !current_user
      redirect_to new_user_registration_path
    else
      @complaint = Complaint.new(complaint_params)
      @complaint.user = current_user
      @complaint.company = @company
      @complaint.save
      redirect_to company_path(@company)
    end
  end

  def update
    @complaint.update(complaint_params)
    redirect_to profile_path
  end

  def destroy
    @complaint.destroy
  end


  private

  def complaint_params
    params.require(:complaint).permit(:title, :description, :status, :category, :photo)
  end

  def set_company
    if params[:company_id]
      @company = Company.find(params[:company_id])
    end
  end

  def set_user
    @user = current_user
  end
end
