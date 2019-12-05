class Article < ApplicationRecord
  belongs_to :category
  belongs_to :country
  has_many :favorites
  has_many :users, through: :favorites
  validates :title, uniqueness: { scope: :source_name,
                                  message: "should be unique for source" }
end
