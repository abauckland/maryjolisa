# This migration comes from mjweb (originally 20140607222850)
class CreateMjwebDetails < ActiveRecord::Migration
  def change
    create_table :mjweb_details do |t|

      t.integer :company_id
      t.string :tagline
      t.string :facebook
      t.string :twitter
      t.string :googleplus
      t.string :linkedin

      t.timestamps
    end
  end
end
