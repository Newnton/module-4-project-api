class User < ApplicationRecord
  has_many :saver_listings
  has_many :listings
  has_secure_password
end
