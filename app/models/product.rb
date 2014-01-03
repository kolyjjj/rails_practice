class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence:{message: '请输入描述'}, length: {minimum: 10, message: '描述长度不小于10'}
  validates :price, presence: {message: '请输入价格'}
  validates :image_url, presence: true
  #validates_with EmailValidator
  validates :tags, presence: {message: '请输入标签'}
end
