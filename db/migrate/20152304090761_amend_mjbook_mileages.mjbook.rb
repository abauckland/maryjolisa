# This migration comes from mjbook (originally 20150626145432)
class AmendMjbookMileages < ActiveRecord::Migration
  def change
    remove_column :mjbook_mileages, :travel_date
    remove_column :mjbook_mileages, :user_id
    remove_column :mjbook_mileages, :project_id

    add_column :mjbook_mileages, :expense_id, :integer

  end
end