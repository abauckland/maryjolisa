# This migration comes from mjbook (originally 20141001082117)
class CreateMjbookUnits < ActiveRecord::Migration
  def change
    create_table :mjbook_units do |t|
      t.text :text

      t.timestamps
    end
  end
end
