# This migration comes from mjbook (originally 20140915200918)
class CreateMjbookHmrcexpcats < ActiveRecord::Migration
  def change
    create_table :mjbook_hmrcexpcats do |t|
      t.integer :company_id
      t.string :category
      t.integer :group_id

      t.timestamps
    end
  end
end
