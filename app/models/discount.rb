class Discount < ApplicationRecord
  validates :name, :amount, :discount_type, presence: true
  validates :amount, numericality: {only_integer: true, less_than: 101, greater_than: -1}
  scope :search, -> (filter) { 
    where(
      "(name ILIKE ?) OR 
      (description = ?) OR
      (discount_type = ?) OR
      (amount = ?)",
      "%#{filter.strip}%",
      "%#{filter.strip}%",
      "%#{filter.strip}%",
      filter.strip.to_i
    )
  }

  has_many :documents
  has_many :clients
end
