class ComplaintsController < ApplicationController
  before_action :set_company
  before_action :set_user

  def show
    @complaint = Complaint.find(params[:id])
  end

  def new
    @complaint = Complaint.new
  end

  def create
    if !current_user
      redirect_to new_user_registration_path
    end
      @complaint = Complaint.new(complaint_params)
      @complaint.user = current_user
      @complaint.company = @company
      @complaint.save
    if @complaint.save
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
    # @company = Company.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
