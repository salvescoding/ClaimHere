class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @complaints = Complaint.paginate(page: params[:page], per_page: 8)
  end
end
