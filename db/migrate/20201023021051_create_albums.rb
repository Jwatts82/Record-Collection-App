class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.integer :release_year
      t.decimal :duration
      t.string :genre
      t.integer :user_id #foreign key

    end
  end
end
