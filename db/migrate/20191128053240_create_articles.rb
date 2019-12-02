class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :source
      t.string :source_name
      t.string :author
      t.string :title
      t.string :description
      t.string :url
      t.string :url_to_image
      t.datetime :published_at
      t.text :content

      t.timestamps
    end
  end
end
