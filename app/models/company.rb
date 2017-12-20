class Company < ApplicationRecord
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

  def complaints_answered
    complaints.where.not(response: nil).count
  end

  def complaints_solved
    complaints.where(status: '1').count
  end


end
