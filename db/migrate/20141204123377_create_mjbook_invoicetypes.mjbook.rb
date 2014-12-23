# This migration comes from mjbook (originally 20141016091706)
class CreateMjbookInvoicetypes < ActiveRecord::Migration
  def change
    create_table :mjbook_invoicetypes do |t|
      t.string :text

      t.timestamps
    end
  end
end
