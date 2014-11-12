# This migration comes from mjweb (originally 20141104213458)
class CreateMjwebLinktiles < ActiveRecord::Migration
  def change
    create_table :mjweb_linktiles do |t|
      t.integer :content_id
      t.string :title
      t.integer :icon_id
      t.integer :page_id
      t.string :link_url
      t.integer :type_id, default: 1

      t.timestamps
    end
  end
end
