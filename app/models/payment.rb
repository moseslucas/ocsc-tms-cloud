class Payment < ApplicationRecord
  belongs_to :document
  belongs_to :employee, optional:true
end
