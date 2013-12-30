class Product < ActiveRecord::Base
  validate :title, presence: true
  validate :description, presence: true, length: {minimum: 10}
  validate :price, presence: true
  validate :image_url, presence: true
  validate :tags, presence: true
end
