# This migration comes from mjweb (originally 20140625200027)
class CreateMjwebDesigns < ActiveRecord::Migration
  def change
    create_table :mjweb_designs do |t|
      t.integer :company_id
      t.string :tile_colour, default: "#572c73"
      t.string :background_id, default: 1
      t.string :font_id, default: 1

      t.timestamps
    end
  end
end
