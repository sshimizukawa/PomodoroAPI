class CreateMusicSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :music_sessions do |t|
      t.integer :length, null:false, default: 300000
      t.string :purpose, null: false, default:""
      t.integer :priority, null:false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
