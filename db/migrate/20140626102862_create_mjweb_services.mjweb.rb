# This migration comes from mjweb (originally 20140626091257)
class CreateMjwebServices < ActiveRecord::Migration
  def change
    create_table :mjweb_services do |t|
      t.integer :company_id
      t.string :title
      t.text :text
      t.string :link
      t.integer :image_id

      t.timestamps
    end
  end
end
