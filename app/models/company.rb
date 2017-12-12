class Company < ApplicationRecord
  has_many :complaints, dependent: :destroy
  has_many :users, through: :complaints
end
