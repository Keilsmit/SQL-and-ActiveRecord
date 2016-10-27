class Item < ApplicationRecord
  has_many :orders
  validates_presence_of :title
end
