class Phrase < ApplicationRecord
  belongs_to :song
  belongs_to :user

  CURRENT_LEVELS = [0,25,50,75,100]

  validates :level, inclusion: { in: CURRENT_LEVELS }
end
