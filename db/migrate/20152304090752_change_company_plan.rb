class ChangeCompanyPlan < ActiveRecord::Migration
  def change
    remove_column :companies, :plan
    add_column :companies, :group, :integer
  end
end
