# This migration comes from mjweb (originally 20140614202943)
class CreateMjwebContents < ActiveRecord::Migration
  def change
    create_table :mjweb_contents do |t|
      t.integer :company_id
      t.integer :tile_id
      t.integer :tile_ref
      t.string :display, default: "All devices"

      t.timestamps
    end
  end
end
