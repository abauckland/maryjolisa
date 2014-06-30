# This migration comes from mjweb (originally 20140625200027)
class CreateMjwebDesigns < ActiveRecord::Migration
  def change
    create_table :mjweb_designs do |t|
      t.integer :company_id, :null => false
      t.string :tile_colour, :default => "#572c73", :null => false
      t.string :background, :default => "background", :null => false
      t.string :font, :default => "Marck Script", :null => false

      t.timestamps
    end
  end
end
