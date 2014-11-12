# This migration comes from mjweb (originally 20141104213338)
class CreateMjwebPages < ActiveRecord::Migration
  def change
    create_table :mjweb_pages do |t|
      t.integer :company_id
      t.string :name

      t.timestamps
    end
  end
end
