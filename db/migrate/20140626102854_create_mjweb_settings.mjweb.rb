# This migration comes from mjweb (originally 20140607222525)
class CreateMjwebSettings < ActiveRecord::Migration
  def change
    create_table :mjweb_settings do |t|

      t.timestamps
    end
  end
end
