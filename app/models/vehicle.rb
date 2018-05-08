class Vehicle < ApplicationRecord
  has_many :document_vehicles
  has_many :documents, through: :document_vehicles
end
