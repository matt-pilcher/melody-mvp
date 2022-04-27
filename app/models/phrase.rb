class Phrase < ApplicationRecord
  belongs_to :song

  CURRENT_LEVELS = [0,25,50,75,100]

  validates :level, inclusion: { in: CURRENT_LEVELS }
end
