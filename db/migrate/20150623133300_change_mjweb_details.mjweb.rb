class ChangeMjwebDetails < ActiveRecord::Migration
  def change
    add_column :mjweb_details, :instagram, :string
  end
end