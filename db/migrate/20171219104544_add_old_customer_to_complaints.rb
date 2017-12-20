class AddOldCustomerToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :old_customer, :boolean, default: false
  end
end
