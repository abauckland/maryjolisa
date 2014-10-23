class AddRetailSubdomainToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :retail_subdomain, :string
    add_index :companies, :retail_subdomain
  end
end
