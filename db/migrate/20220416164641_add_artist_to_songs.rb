class AddArtistToSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :artist_name, :string
  end
end
