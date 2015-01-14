# This migration comes from mjbook (originally 20150108113000)
class CreateMjbookMiscincomes < ActiveRecord::Migration
  def change
    create_table :mjbook_miscincomes do |t|
      t.integer :company_id
      t.string :ref
      t.integer :project_id
      t.timestamp :date
      t.decimal :price, :precision => 8, :scale => 2, default: 0.00
      t.decimal :vat, :precision => 8, :scale => 2, default: 0.00
      t.decimal :total, :precision => 8, :scale => 2, default: 0.00
      t.integer :customer_id
      t.string :customer_ref
      t.integer :recurrence
      t.text :note
      t.string :state

      t.timestamps
    end
  end
end
