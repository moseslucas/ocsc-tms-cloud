class DocumentDetail < ApplicationRecord
  belongs_to :document_shipping, class_name:'Document', optional:true
  belongs_to :document, class_name:'Document', foreign_key:'document_id'

  # belongs_to :document_shipping, :class_name=>'DocumentDetail', optional:true
  has_many :document_tags
end
