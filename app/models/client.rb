class Client < ApplicationRecord
  validates :name, presence: true
  scope :premium, -> { where(branch: ["master"]) }
  scope :search, -> (filter) { 
    where(
      "(name ILIKE ?) OR
      (description ILIKE ?) OR
      (contact ILIKE ?) OR
      (email ILIKE ?) OR
      (address ILIKE ?)",
      "%#{filter.strip}%",
      "%#{filter.strip}%",
      "%#{filter.strip}%",
      "%#{filter.strip}%",
      "%#{filter.strip}%"
    )
  }

  has_many :documents
  has_many :payments, through: :documents
  belongs_to :discount, optional:true


end
