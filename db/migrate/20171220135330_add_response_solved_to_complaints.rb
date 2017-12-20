class AddResponseSolvedToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :response_solved, :boolean, default: false
  end
end
