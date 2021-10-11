class CreateMusicLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :music_links do |t|
      t.string :purpose, null: false
      t.integer :priority, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
