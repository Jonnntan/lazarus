class Variant < ApplicationRecord
  validates :name, :inventory, :price, :product, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true

  belongs_to :product
end
