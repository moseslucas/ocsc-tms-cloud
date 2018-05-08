class Location < ApplicationRecord
  belongs_to :company
  # has_many :documents
  has_many :sources, :class_name=>'Document', :foreign_key=>'source_id'
  has_many :destinations, :class_name=>'Document', :foreign_key=>'destination_id'
end
