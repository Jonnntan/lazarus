class Brand < ApplicationRecord
  # after_validation :slug_url, only: [:create, :update]
  
  has_many :products, dependent: :destroy
  validates :name, presence: true

  def slug_url
    self.name.to_s.parameterize
  end

  # def to_param
  #   "#{slug_url}"
  # end
end
