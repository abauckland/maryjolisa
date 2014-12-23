# This migration comes from mjbook (originally 20141001082058)
class CreateMjbookVats < ActiveRecord::Migration
  def change
    create_table :mjbook_vats do |t|
      t.string :cat
      t.decimal :rate, :precision => 3, :scale => 1

      t.timestamps
    end
  end
end
