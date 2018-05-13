class Payment < ApplicationRecord
  belongs_to :document
  has_many :clients, through: :document
  belongs_to :employee, optional:true

  validates :amount, numericality: { greater_than: 0 }
end
