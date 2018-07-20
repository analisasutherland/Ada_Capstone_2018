require 'wombat'
require 'pry'

review_data = WombatScraper.new.crawl
TAG_WORDS = %w[adventure mystery RPG portable puzzle]

review_data['the_articles'].each do |review|
  # if article is empty or it is nil, jump to the next
  next if review['article'].nil? || review['article'].empty?

  tentative_title = review['article'][0]['titles']
  tentative_image = review['article'][0]['image']

  next if tentative_title.empty? || tentative_title.nil?

  next if tentative_image.nil?

  if tentative_title.nil? || tentative_title.length.nil?
    title = 'untitled'
  else
    title = tentative_title.group_by(&:itself).values.max_by(&:size).first
  end

  if tentative_image.nil?
    image = 'no image'
  else
    image = tentative_image
  end

  new_game = Game.find_or_create_by!(game_title: title, image: image)

  # The content is broken up into separate index based on paragraphs. Joining them together at a line break
  content = review['article'][0]['content']
  complete_content = content.join("\n")

  begin
    puts "creating review #{tentative_title}"
    new_review = Review.create!(title: title, content: complete_content, game: new_game)

    # This will be a build out to associate a tag word with a review.

    # Will search through a review to see if tag appears and add tag
    puts "Adding tags for #{new_review.title}"

    # iterate through the tag words
    TAG_WORDS.each do |tag_word|
      if new_review.content.include?(tag_word)
        new_tag = Tag.find_or_create_by!(tag_word: tag_word)

        new_review.tags << new_tag
      end
    end
  rescue
    binding.pry
    # TODO: replace with error/status handling
  end
end
