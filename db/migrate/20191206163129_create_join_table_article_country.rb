class CreateJoinTableArticleCountry < ActiveRecord::Migration[6.0]
  def change
    create_join_table :articles, :countries do |t|
      # t.index [:article_id, :country_id]
      # t.index [:country_id, :article_id]
    end
  end
end
