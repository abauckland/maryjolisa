# This migration comes from mjbook (originally 20141008221822)
class CreateMjbookInvoiceterms < ActiveRecord::Migration
  def change
    create_table :mjbook_invoiceterms do |t|
      t.integer :company_id
      t.string :ref
      t.integer :period
      t.text :terms

      t.timestamps
    end
  end
end
