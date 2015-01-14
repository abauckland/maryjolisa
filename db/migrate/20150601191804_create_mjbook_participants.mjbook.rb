# This migration comes from mjbook (originally 20150106100230)
class CreateMjbookParticipants < ActiveRecord::Migration
  def change
    create_table :mjbook_participants do |t|
      t.string :title
      t.string :first_name
      t.string :surname
      t.string :house
      t.string :postcode

      t.timestamps
    end
  end
end
