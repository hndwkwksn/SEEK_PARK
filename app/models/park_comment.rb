class ParkComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :park

  validates :comment,presence:true,length:{maximum:200}
end
