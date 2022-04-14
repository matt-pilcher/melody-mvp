class Song < ApplicationRecord
  validates :title, presence: true
  validates :lyrics, presence: true, length: { minimum: 5 }
end
