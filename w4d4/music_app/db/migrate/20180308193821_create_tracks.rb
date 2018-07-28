class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.text :lyrics
      t.integer :ord
      t.integer :album_id
      t.string :track_type
    end
  end
end
