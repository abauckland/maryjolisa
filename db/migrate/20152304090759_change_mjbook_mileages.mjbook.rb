# This migration comes from mjbook (originally 20150624161512)
class ChangeMjbookMileages < ActiveRecord::Migration
  def change
    remove_column :mjbook_mileages, :date
    remove_column :mjbook_mileages, :hmrcexpcat_id

    add_column :mjbook_mileages, :travel_date, :timestamp
  end
end