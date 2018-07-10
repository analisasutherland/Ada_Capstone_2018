require 'wombat'

review_data = WombatScraper.new.crawl

puts review_data

review_data.each do |review|
  title = review_data['the_articles'][0]['article'][0]['title']
  content = review_data['the_articles'][0]['article'][0]['content']
  Review.create!(title: title, content: content)
end
