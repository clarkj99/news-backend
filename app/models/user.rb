class User < ApplicationRecord
  has_many :favorites
  has_many :articles, through: :favorites

  before_validation :downcase_fields
  validates :username, length: { in: 4..16 }, format: { without: /\s/, message: "what??? - must contain no spaces" }, uniqueness: true, presence: true

  private

  def downcase_fields
    self.username.downcase!
  end
end
