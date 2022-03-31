class Record < ApplicationRecord
  belongs_to :genre
  has_many :record_producers
  has_many :record_writers
  has_many :writers, through: :record_writers
  has_many :producers, through: :record_producers

  validates :name, presence: true
  has_one_attached :image
end
