class Customer < ApplicationRecord
  has_one_attached :image

  validates_presence_of :full_name
end
