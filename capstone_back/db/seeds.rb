require 'wombat'
require 'pry'

review_data = WombatScraper.new.crawl

# puts review_data

review_data['the_articles'].each do |review|
  # if article is empty or it is nil, jump to the next
  next if review['article'].nil? || review['article'].empty?

  tentative_title = review['article'][0]['titles']

  next if tentative_title.length == 0

  if tentative_title.nil? || tentative_title.length.nil?
    title = 'untitled'
  else
    begin
      title = tentative_title.group_by(&:itself).values.max_by(&:size).first
    # rescue
    #   binding.pry
    end
  end

  my_game = Game.create!(game_title: title) if Game.find_by(game_title: title).nil?

  # puts "#{title} is valid: #{my_game.valid?}"
  # if !my_game.valid?
  #   puts "my_game.errors"
  # end

  # The content is broken up into separate index based on paragraphs. Joining them together at a line break
  content = review['article'][0]['content']
  complete_content = content.join("\n")

  begin
    puts "creating review #{tentative_title}"
    Review.create!(title: title, content: complete_content)
  rescue
    binding.pry
  end
end
