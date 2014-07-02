# This migration comes from mjweb (originally 20140701122852)
class CreateMjwebBackgrounds < ActiveRecord::Migration
  def change
    create_table :mjweb_backgrounds do |t|
      t.string :name
      t.string :background

      t.timestamps
    end
  end
end
