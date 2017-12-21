class Company < ApplicationRecord
  include HasComplaints
  has_many :complaints, dependent: :destroy
  has_many :users, through: :complaints


 def company_rating
    if complaints.any?
      ratings = []
      complaints.each do |complaint|
        ratings << complaint.company_rating
      end
      (ratings.sum)/ratings.count
    end
  end

  def complaints_received
    complaints.count
  end


end
