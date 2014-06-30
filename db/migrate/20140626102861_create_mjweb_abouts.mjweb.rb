# This migration comes from mjweb (originally 20140625213057)
class CreateMjwebAbouts < ActiveRecord::Migration
  def change
    create_table :mjweb_abouts do |t|
      t.integer :company_id
      t.string :title
      t.text :text
      t.integer :image_id

      t.timestamps
    end
  end
end
