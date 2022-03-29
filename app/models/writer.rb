class Writer < ApplicationRecord
  has_many :record_writers
  has_many :records, through: :record_writers
end
