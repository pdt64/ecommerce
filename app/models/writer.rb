class Writer < ApplicationRecord
  has_many :record_writers, dependent: :nullify
  has_many :records, through: :record_writers
  validates :writer_name, presence: true
end
