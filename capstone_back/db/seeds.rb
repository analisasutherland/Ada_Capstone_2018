require 'wombat'

review_data = WombatScraper.new.crawl

puts review_data

review_data['the_articles'].each do |review|
  # if article is empty or it is nil, jump to the next
  next if review['article'].nil? || review['article'].empty?

  title = review['article'][0]['title'] || 'untitled'
  # The content is broken up into separate index based on paragraphs. Joining them together at a line break
  content = review['article'][0]['content']
  complete_content = content.join("\n")
  Review.create!(title: title, content: complete_content)
end
