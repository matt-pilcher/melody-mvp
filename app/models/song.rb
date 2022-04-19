class Song < ApplicationRecord
  has_many :phrases, dependent: :destroy

  validates :title, presence: true
  validates :lyrics, presence: true, length: { minimum: 5 }
end
