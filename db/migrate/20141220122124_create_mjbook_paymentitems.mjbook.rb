# This migration comes from mjbook (originally 20141209183516)
class CreateMjbookPaymentitems < ActiveRecord::Migration
  def change
    create_table :mjbook_paymentitems do |t|
      t.integer :payment_id
      t.integer :inline_id
      t.integer :donation_id
      t.integer :miscpayment_id
      t.integer :transfer_id
      t.timestamps
    end
  end
end
