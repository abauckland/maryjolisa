# This migration comes from mjweb (originally 20140626092024)
class CreateMjwebHours < ActiveRecord::Migration
  def change
    create_table :mjweb_hours do |t|
      t.integer :company_id
      t.integer :monday_status, :default => 1
      t.timestamp :monday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :monday_close, :default => "2000-01-01 17:30:00"
      t.integer :tuesday_status, :default => 1
      t.timestamp :tuesday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :tuesday_close, :default => "2000-01-01 17:30:00"
      t.integer :wednesday_status, :default => 1
      t.timestamp :wednesday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :wednesday_close, :default => "2000-01-01 17:30:00"
      t.integer :thursday_status, :default => 1
      t.timestamp :thursday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :thursday_close, :default => "2000-01-01 17:30:00"
      t.integer :friday_status, :default => 1
      t.timestamp :friday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :friday_close, :default => "2000-01-01 17:30:00"
      t.integer :saturday_status, :default => 1
      t.timestamp :saturday_open, :default => "2000-01-01 09:30:00"
      t.timestamp :saturday_close, :default => "2000-01-01 17:30:00"
      t.integer :sunday_status, :default => 1
      t.timestamp :sunday_open, :default => "2000-01-01 11:00:00"
      t.timestamp :sunday_close, :default => "2000-01-01 16:30:00"

      t.timestamps
    end
  end
end
