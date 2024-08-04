class CarbonFootprint < ApplicationRecord
  belongs_to :user

  validates :type_of_public_transport, :type_of_car, :hours_driven_per_week, :monthly_electricity_usage, :diet, :waste_management, presence: true
end
