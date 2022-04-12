class Genre < ApplicationRecord
  has_many :records
  validates :name, uniqueness: true
end
