class MusicLink < ApplicationRecord
  belongs_to :user
  has_one_attached :music_file
end
