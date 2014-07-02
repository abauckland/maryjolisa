# This migration comes from mjweb (originally 20140701124217)
class CreateMjwebFonts < ActiveRecord::Migration
  def change
    create_table :mjweb_fonts do |t|
      t.string :name
      t.string :style

      t.timestamps
    end
  end
end
