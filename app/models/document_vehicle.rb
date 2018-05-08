class DocumentVehicle < ApplicationRecord
  belongs_to :document
  belongs_to :vehicle
end
