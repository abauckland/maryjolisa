# This migration comes from mjbook (originally 20140909192825)
class CreateMjbookInvoicemethods < ActiveRecord::Migration
  def change
    create_table :mjbook_invoicemethods do |t|
      t.string :method

      t.timestamps
    end
  end
end
