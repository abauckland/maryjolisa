# This migration comes from mjbook (originally 20141213111024)
class CreateMjbookCreditnoteitems < ActiveRecord::Migration
  def change
    create_table :mjbook_creditnoteitems do |t|
      t.integer :creditnote_id
      t.integer :inline_id

      t.timestamps
    end
  end
end
