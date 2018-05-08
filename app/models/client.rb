class Client < ApplicationRecord
  validates :name, presence: true
  scope :search, -> (filter) { 
    where(
      "(name ILIKE ?) OR
      (description ILIKE ?) OR
      (contact ILIKE ?) OR
      (email ILIKE ?) OR
      (address ILIKE ?) OR
      (credit_limit = ?)",
      "%#{filter.strip}%",
      "%#{filter.strip}%",
      "%#{filter.strip}%",
      "%#{filter.strip}%",
      "%#{filter.strip}%",
      filter.strip.to_i
    )
  }

  has_many :documents
  belongs_to :discount, optional:true
end
