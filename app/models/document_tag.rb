class DocumentTag < ApplicationRecord
  belongs_to :document_detail
  has_many :documents, through: :document_detail
end
