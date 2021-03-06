# This migration comes from mjbook (originally 20141016091736)
class CreateMjbookInlines < ActiveRecord::Migration
  def change
    create_table :mjbook_inlines do |t|
      t.integer :ingroup_id
      t.string :cat, default: "Select category"
      t.string :item, default: "Select item"
      t.decimal :quantity, :precision => 8, :scale => 0, default: 0
      t.integer :unit_id, default: 1
      t.decimal :rate, :precision => 8, :scale => 2, default: 0.00
      t.decimal :price, :precision => 8, :scale => 2, default: 0.00
      t.integer :vat_id, default: 1
      t.decimal :vat_due, :precision => 8, :scale => 2, default: 0.00
      t.decimal :total, :precision => 8, :scale => 2, default: 0.00
      t.text :note
      t.integer :line_order, default: 1
      t.integer :linetype, default: 1

      t.timestamps
    end
  end
end
