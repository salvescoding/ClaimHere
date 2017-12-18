class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_attachment :photo
  validates :company_rating, presence: true
end
