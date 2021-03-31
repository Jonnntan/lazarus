class Product < ApplicationRecord
  validates :title, :description, :brand, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true

  belongs_to :brand
  has_many :variants
end
