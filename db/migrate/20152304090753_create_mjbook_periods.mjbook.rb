# This migration comes from mjbook (originally 20150410132713)
class CreateMjbookPeriods < ActiveRecord::Migration
  def change
    create_table :mjbook_periods do |t|
      t.integer :company_id
      t.string :period
      t.timestamp :year_start
      t.decimal :retained

      t.timestamps
    end
  end
end
