class AddResponseRatingToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :response_rating, :integer, default: 0
  end
end
