class Genre < ApplicationRecord
  has_many :records, dependent: :nullify
  validates :name, presence: true
end
