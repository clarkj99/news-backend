class Article < ApplicationRecord
  has_many :articles_categories
  has_many :categories, through: :articles_categories
  has_many :articles_countries
  has_many :countries, through: :articles_countries
  has_many :favorites
  has_many :users, through: :favorites
end
