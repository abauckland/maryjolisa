# This migration comes from mjweb (originally 20140816183723)
class CreateMjwebEvents < ActiveRecord::Migration
  def change
    create_table :mjweb_events do |t|
      t.integer :company_id
      t.string :topic
      t.timestamp :date      
      t.timestamp :start
      t.timestamp :finish
      t.string :venue
      t.string :address
      t.string :postcode
      t.string :link

      t.timestamps
    end
  end
end
