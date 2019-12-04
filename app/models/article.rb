class Article < ApplicationRecord
  belongs_to :category
  belongs_to :country
  validates :title, uniqueness: { scope: :source_name,
                          message: "should be unique for source" }
end
