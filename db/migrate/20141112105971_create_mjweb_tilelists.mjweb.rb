# This migration comes from mjweb (originally 20141112093412)
class CreateMjwebTilelists < ActiveRecord::Migration
  def change
    create_table :mjweb_tilelists do |t|
      t.integer :linktile_id
      t.string :text

      t.timestamps            
    end
  end
end
