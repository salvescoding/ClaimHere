class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @complaints = Complaint.all
    @users = User.all
  end
end
