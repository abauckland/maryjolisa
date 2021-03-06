# This migration comes from mjbook (originally 20140909192938)
class CreateMjbookSuppliers < ActiveRecord::Migration
  def change
    create_table :mjbook_suppliers do |t|
      t.integer :company_id
      t.string :title
      t.string :first_name
      t.string :surname
      t.string :position
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :county
      t.string :country
      t.string :postcode
      t.string :phone
      t.string :alt_phone
      t.string :email
      t.string :company_name
      t.text :notes
      t.string :vat_no      

      t.timestamps
    end
  end
end
