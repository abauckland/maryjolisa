class ChangeMjwebInfos < ActiveRecord::Migration
  def change
    add_column :mjweb_infos, :link_type, :integer
  end
end