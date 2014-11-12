# This migration comes from mjweb (originally 20141104213427)
class CreateMjwebInfo < ActiveRecord::Migration
  def change
    create_table :mjweb_infos do |t|
      t.integer :order_ref
      t.integer :page_id
      t.string :title
      t.text :text
      t.string :link_text
      t.string :link_url
      t.string :link_page_id
      t.integer :image_id

      t.timestamps
    end
  end
end
