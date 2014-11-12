# This migration comes from mjweb (originally 20141104213412)
class CreateMjwebIcons < ActiveRecord::Migration
  def change
    create_table :mjweb_icons do |t|
      t.string :name
      t.string :icon
      t.string :icon_black
      t.string :icon_white

      t.timestamps
    end
  end
end
