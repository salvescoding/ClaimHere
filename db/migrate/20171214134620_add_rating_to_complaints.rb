class AddRatingToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :company_rating, :integer
  end
end
