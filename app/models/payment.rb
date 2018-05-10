class Payment < ApplicationRecord
  belongs_to :document
  has_many :clients, through: :document
  belongs_to :employee, optional:true
end
