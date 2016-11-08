class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :image
      t.string :location
      t.integer :owner_id

      t.timestamps

    end
  end
end
