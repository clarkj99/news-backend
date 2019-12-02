# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

news_api_key = CONFIG[:news_api_key]
$categories = ["business", "entertainment", "health", "science", "sports", "technology"]

$newsapi = News.new(news_api_key)

def make_articles(category)
  articles = $newsapi.get_top_headlines(country: "us", category: category.name, pageSize: 100)
  articles.each do |article|
    Article.create(source: article.id,
                   source_name: article.name,
                   author: article.author,
                   title: article.title,
                   description: article.description,
                   content: article.content,
                   url: article.url,
                   url_to_image: article.urlToImage,
                   published_at: article.publishedAt,
                   category: category)
  end
  puts "  created category #{category.name}, #{Article.all.count} articles total"
end

$categories.each do |category|
  cat = Category.create(name: category)
  make_articles(cat)
end
