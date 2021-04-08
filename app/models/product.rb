class Product < ApplicationRecord
  validates :title, :description, :brand, presence: true

  belongs_to :brand
  has_many :variants, dependent: :destroy
  accepts_nested_attributes_for :variants
end
