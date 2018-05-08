class Employee < ApplicationRecord
  has_many :payments
  has_many :document_employees
  has_many :documents, through: :document_employees
end
