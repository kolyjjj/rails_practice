class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 10}
  validates :price, presence: true
  #validates :image_url, presence: true
  validates_with EmailValidator
  validates :tags, presence: true
end
