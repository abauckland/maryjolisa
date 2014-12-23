# This migration comes from mjbook (originally 20140915200922)
class CreateMjbookMileagemodes < ActiveRecord::Migration
  def change
    create_table :mjbook_mileagemodes do |t|
      t.integer :company_id
      t.string :mode
      t.decimal :rate, :precision => 8, :scale => 2
      t.decimal :hmrc_rate, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
