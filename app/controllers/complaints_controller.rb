class ComplaintsController < ApplicationController
  before_action :set_company, only: [:new, :create_complaint_user_signed_in, :create_complaint_user_not_signed_in, :create]
  before_action :set_user
  before_action :set_complaint, except: [:new, :create]
  skip_before_action :authenticate_user!, only: [:new, :create, :show]


  def show
  end

  def new
    @complaint = Complaint.new
    @categories = ["Product/service", "Customer service", "After sales", "Shipping", "Other"]
    @rating = (1..5)
  end

  def create
    if !current_user
      create_complaint_user_not_signed_in
    else
      create_complaint_user_signed_in
    end
  end

  def create_complaint_user_signed_in
    @complaint = Complaint.new(complaint_params)
    @complaint.user = current_user
    @complaint.company_id = @company.id
    if @complaint.save
      redirect_to company_path(@company)
     else
       render :new
    end
  end


  def create_complaint_user_not_signed_in
   #when user starts complaint from the company page
    cookies[:complaint] = complaint_params.to_json
    cookies[:company_id] = @company.id
    redirect_to new_user_registration_path

    #When user starts complaint from home page
    # unless @company
    #   cookies[:company_id] = params[:company_id]
  end

  def update
    if @complaint.response.nil?
      @complaint.update(complaint_params)
      redirect_to complaint_path(@complaint)
    else
      @complaint.update(complaint_params)
      redirect_to profile_path
    end
  end

  def destroy
    @complaint.destroy
  end

  def updaterating
    @complaint.update(response_rating: params[:orange])
    if @complaint.save
      redirect_to profile_path
   end
  end

  def marksolved
    @complaint.response_solved = true
    @complaint.save
    redirect_to profile_path
  end

  def markunsolved
    @complaint.response_solved = false
    @complaint.save
    redirect_to profile_path
  end


  private

  def complaint_params
    params.require(:complaint).permit(:company_id, :title, :orange, :description, :response_rating, :status, :company_rating, :category, :photo, :response, :old_customer)
  end

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  def set_company
    if !params[:company_id].nil?
      @company = Company.find(params[:company_id])
    else
      @company = Company.find(@company.id)
    end
  end

  def set_user
    @user = current_user
  end
end
