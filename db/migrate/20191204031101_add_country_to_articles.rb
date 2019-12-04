class AddCountryToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :country, foreign_key: true
  end
end
