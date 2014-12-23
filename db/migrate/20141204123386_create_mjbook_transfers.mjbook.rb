# This migration comes from mjbook (originally 20141027191039)
class CreateMjbookTransfers < ActiveRecord::Migration
  def change
    create_table :mjbook_transfers do |t|
      t.integer :company_id
      t.integer :user_id
      t.integer :account_from_id
      t.integer :account_to_id
      t.integer :paymethod_id
      t.string :total, :precision => 8, :scale => 2, default: 0.00
      t.timestamp :date
      t.string :state

      t.timestamps
    end
  end
end
