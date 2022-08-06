class ParkComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :park
end
