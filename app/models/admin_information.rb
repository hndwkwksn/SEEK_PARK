class AdminInformation < ApplicationRecord
  validates :information, presence: true, length: { maximum: 100 }
end
