class AddDomainToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :domain, :string
  end
end
