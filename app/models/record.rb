class Record < ApplicationRecord
  belongs_to :genre
  has_many :record_producers, dependent: :nullify
  has_many :record_writers, dependent: :nullify
  has_many :writers, through: :record_writers
  has_many :producers, through: :record_producers

  accepts_nested_attributes_for :record_producers, allow_destroy: true

  validates :name, :description, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  has_one_attached :image
end
