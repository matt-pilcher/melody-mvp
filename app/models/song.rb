class Song < ApplicationRecord
  has_many :phrases

  validates :title, presence: true
  validates :lyrics, presence: true, length: { minimum: 5 }
end
