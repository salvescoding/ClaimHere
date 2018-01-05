class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!



  def after_sign_in_path_for(resource)
    if !cookies[:complaint].nil?
     arguments = JSON.parse(cookies[:complaint])
     complaint = Complaint.new(arguments)
     complaint.user = current_user
     company_id = cookies[:company_id]
     complaint.company_id = company_id
     complaint.save!
     cookies.delete(:complaint)
     company_path(company_id)
   else
     root_path
   end
  end


end
