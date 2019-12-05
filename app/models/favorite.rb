class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :user, uniqueness: { scope: :article,
                         message: "only one favorite per article" }
end
