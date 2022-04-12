class Record < ApplicationRecord
  belongs_to :genre
  has_many :record_producers
  has_many :record_writers
  has_many :writers, through: :record_writers
  has_many :producers, through: :record_producers

  validates :name, :description, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  has_one_attached :image
end
