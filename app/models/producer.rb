class Producer < ApplicationRecord
  has_many :record_producers
  has_many :records, through: :record_producers
  validates :producer_name, presence: true
end
