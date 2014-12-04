# This migration comes from mjbook (originally 20140915200919)
class CreateMjbookHmrcgroups < ActiveRecord::Migration
  def change
    create_table :mjbook_hmrcgroups do |t|
      t.string :group

      t.timestamps
    end
  end
end
