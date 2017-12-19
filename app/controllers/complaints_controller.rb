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
    @categories = ["Telecomunications", "Retail", "Airline"]
    @rating = (1..5)
  end

  def create
    if !current_user
      unless @company
        cookies[:company_id] = params[:complaint][:company_id]
        cookies[:complaint] = complaint_params.to_json
        redirect_to new_user_registration_path
      else
        cookies[:company_id] = @company.id
        cookies[:complaint] = complaint_params.to_json
        redirect_to new_user_registration_path
      end
    else
      @complaint = Complaint.new(complaint_params)
      @complaint.user = current_user

      if !params[:complaint][:company_id].nil?
        @complaint.company_id = params[:complaint][:company_id]
        @complaint.save
        redirect_to company_path(params[:complaint][:company_id])

      elsif !params[:company_id].nil?
         @complaint.company_id = params[:company_id]
         @complaint.save
        redirect_to company_path(params[:company_id])
      else
         render :new
         flash[:notice] = "We could not save your complaint!"
      end
    end
  end

  def update
    @complaint = Complaint.find(params[:id])
    @complaint.update(complaint_params)
    redirect_to complaint_path(@complaint)
  end

  def destroy
    @complaint.destroy
  end


  private

  def complaint_params
    params.require(:complaint).permit(:company_id, :title, :description, :status, :company_rating, :category, :photo, :response)
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
