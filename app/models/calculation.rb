class Calculation < ApplicationRecord
  belongs_to :uom, optional: true
  has_many :documents
end
