class Article < ApplicationRecord
  belongs_to :category
  belongs_to :country
  has_many :favorites
  has_many :users, through: :favorites
  validates :title, uniqueness: { scope: :country_id,
                                  message: "should be unique for country" }
end
