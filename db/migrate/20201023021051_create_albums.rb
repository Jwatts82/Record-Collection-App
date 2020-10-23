class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.integer :user_id #foreign key
      
    end
  end
end
