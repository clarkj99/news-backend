class Country < ApplicationRecord
  has_many :articles_countries
  has_many :articles, through: :articles_countries
end
