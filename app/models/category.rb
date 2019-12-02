class Category < ApplicationRecord
  has_many :articles, -> { order "published_at DESC" }
end
