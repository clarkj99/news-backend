# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

news_api_key = CONFIG[:news_api_key]
$categories = ["business", "entertainment", "health", "science", "sports", "technology"]
$countries = ["ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn", "co", "cu", "cz", "de", "eg", "fr", "gb", "gr", "hk", "hu", "id", "ie", "il", "in", "it", "jp", "kr", "lt", "lv", "ma", "mx", "my", "ng", "nl", "no", "nz", "ph", "pl", "pt", "ro", "rs", "ru", "sa", "se", "sg", "si", "sk", "th", "tr", "tw", "ua", "us", "ve", "za"]

$english_countries = [{ code: "au", name: "Australia" }, { code: "ca", name: "Canada" }]
# $english_countries = [{ code: "au", name: "Australia" }, { code: "ca", name: "Canada" }, { code: "gb", name: "Great Britain" }, { code: "id", name: "Ireland" }, { code: "in", name: "India" }, { code: "my", name: "Malaysia" }, { code: "ng", name: "Nigeria" }, { code: "ph", name: "Phillipines" }, { code: "sg", name: "Singapour" }, { code: "us", name: "United States" }, { code: "za", name: "South Africa" }]

$newsapi = News.new(news_api_key)

def make_articles(category, country)
  articles = $newsapi.get_top_headlines(country: country.code, category: category.name, pageSize: 100)
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
                   country: country,
                   category: category)
  end
  puts "Country #{country.name}, Category #{category.name}, #{Article.all.count} articles total"
end

def make_categories(country)
  Category.all.each do |category|
    make_articles(category, country)
  end
end

$categories.each do |category|
  cat = Category.create(name: category)
end

$english_countries.each do |country|
  ctry = Country.create(country)
  make_categories(ctry)
end
