# This migration comes from mjbook (originally 20141008221733)
class CreateMjbookQuoteterms < ActiveRecord::Migration
  def change
    create_table :mjbook_quoteterms do |t|
      t.integer :company_id
      t.string :ref
      t.integer :period
      t.text :terms

      t.timestamps
    end
  end
end
