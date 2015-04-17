class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price
      t.string :braintree_id
      t.boolean :email
      t.boolean :website
      t.boolean :books
      t.boolean :creditunion
      t.boolean :ecommerce

      t.timestamps
    end
  end
end
