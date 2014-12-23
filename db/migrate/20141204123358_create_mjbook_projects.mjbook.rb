# This migration comes from mjbook (originally 20140909192813)
class CreateMjbookProjects < ActiveRecord::Migration
  def change
    create_table :mjbook_projects do |t|
      t.integer :company_id
      t.string :ref
      t.string :title
      t.integer :customer_id
      t.text :description
      t.integer :invoicemethod_id
      t.string :customer_ref

      t.timestamps
    end
  end
end
