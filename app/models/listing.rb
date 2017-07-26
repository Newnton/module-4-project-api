class Listing < ApplicationRecord
  has_many :saver_listings
  belongs_to :user
end
