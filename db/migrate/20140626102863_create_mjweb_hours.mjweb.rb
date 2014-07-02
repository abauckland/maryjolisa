# This migration comes from mjweb (originally 20140626092024)
class CreateMjwebHours < ActiveRecord::Migration
  def change
    create_table :mjweb_hours do |t|
      t.integer :company_id
      t.string :monday_status, :default => "Open"
      t.timestamp :monday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :monday_close, :default => "2000-01-01 17:30:00"
      t.string :tuesday_status, :default =>"Open"
      t.timestamp :tuesday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :tuesday_close, :default => "2000-01-01 17:30:00"
      t.string :wednesday_status, :default =>"Open"
      t.timestamp :wednesday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :wednesday_close, :default => "2000-01-01 17:30:00"
      t.string :thursday_status, :default =>"Open"
      t.timestamp :thursday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :thursday_close, :default => "2000-01-01 17:30:00"
      t.string :friday_status, :default =>"Open"
      t.timestamp :friday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :friday_close, :default => "2000-01-01 17:30:00"
      t.string :saturday_status, :default =>"Open"
      t.timestamp :saturday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :saturday_close, :default => "2000-01-01 17:30:00"
      t.string :sunday_status, :default => "Open"
      t.timestamp :sunday_open, :default => "2000-01-01 11:00:00"
      t.timestamp :sunday_close, :default => "2000-01-01 16:30:00"

      t.timestamps
    end
  end
end
