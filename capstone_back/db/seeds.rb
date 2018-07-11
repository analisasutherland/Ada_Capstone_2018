require 'wombat'

review_data = WombatScraper.new.crawl

puts review_data

review_data['the_articles'].each do |review|
  next if review['article'].nil? || review['article'].empty?

  title = review['article'][0]['title'] || 'untitled'
  content = review['article'][0]['content']
  complete_content = content.join("\n")
  Review.create!(title: title, content: complete_content)
end
