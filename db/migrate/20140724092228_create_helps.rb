class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :item, default: "Help text to be added"
      t.string :text, default: "Help text to be added"

      t.timestamps
    end
  end
end
