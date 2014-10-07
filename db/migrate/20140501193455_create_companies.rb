class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.string :domain, null: false
      t.string :logo
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :county
      t.string :postcode
      t.string :latitude
      t.string :longitude
      t.string :tel
      t.string :alt_tel
      t.string :email
      t.string :reg_no
      t.string :vat_no
      t.integer :plan, default: 2
      
      t.timestamps
    end
    add_index :companies, :name, unique: true
  end
end
