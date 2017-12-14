class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_attachment :photo
end
