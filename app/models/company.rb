class Company < ApplicationRecord
  has_many :locations
  has_many :documents, :class_name=>'Document', :foreign_key=>'origin_id'
end
