class AddPhotoCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photos_count, :integer
  end
end
