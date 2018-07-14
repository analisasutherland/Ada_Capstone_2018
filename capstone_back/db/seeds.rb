require 'wombat'
require 'pry'

review_data = WombatScraper.new.crawl


review_data['the_articles'].each do |review|
  # if article is empty or it is nil, jump to the next
  next if review['article'].nil? || review['article'].empty?

  tentative_title = review['article'][0]['titles']

  next if tentative_title.empty? || tentative_title.nil?

  # TODO: Need to simplfy way that title is set, consider using .first for an array to get first occuring title else if the first element is not the one we want (why??), we will use the long method

  if tentative_title.nil? || tentative_title.length.nil?
    title = 'untitled'
  else
    title = tentative_title.group_by(&:itself).values.max_by(&:size).first
  end

  new_game = Game.find_or_create_by!(game_title: title)

  # The content is broken up into separate index based on paragraphs. Joining them together at a line break
  content = review['article'][0]['content']
  complete_content = content.join("\n")

  begin
    puts "creating review #{tentative_title}"
    Review.create!(title: title, content: complete_content, game: new_game)

    # TODO: This will be a build out to associate a tag word with a review. Will need to search through a review to see if tag appears and add tag if it appears
    # # tag_words = whatever I want to be search terms in an array []
    #
    # iterate through the tag words
    #
    # tag_words.each do |tag_word|
    #   new_tag = Tag.find_or_create_by!(tag_word: tag_word)
  rescue
    binding.pry
  end
end
