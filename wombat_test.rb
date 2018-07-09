require 'wombat'
require 'pry'

# # NOTE: This bit of scrapper code, successfully loops through the first pagination of the reviews page, and pulls out all <p> contents of the review
# class MyScraper
#   include Wombat::Crawler
#   base_url 'https://www.polygon.com'
#   # path '/2018/5/25/17391878/detroit-become-human-review-ps4'
#   path '/reviews'
# # NOTE: Need a loop that loops through all the paginations of articles index pages
#   # content css: 'div.c-entry-content p'
#   the_articles 'css=div.c-entry-box--compact__body a', :follow do
#     # NOTE: This loop loops through all articles on a given index page ie page 1
#     article 'css=div.c-entry-content', :iterator do
#       # NOTE: Loops through a given article and pulls out all <p> tag content
#       content 'css=p', :list
#     end
#   end
# end
#
# x = MyScraper.new.crawl
#
# puts x.to_a.last

class MyScraper
  include Wombat::Crawler
  base_url 'https://www.polygon.com'
  path '/reviews/archives'
  # NOTE: Need a loop that loops through all the paginations of articles index pages
  # article_indexs 'css=a.c-pagination__next c-pagination__link', :follow do
    # NOTE: This loop loops through all articles on a given index page ie page 1
    the_articles 'css=div.c-entry-box--compact__body a', :follow do
      # NOTE: Loops through a given article and pulls out all <p> tag content
      article 'css=div.c-entry-content', :iterator do
        content 'css=p', :list
      end
    end
  # end
end

x = MyScraper.new.crawl

puts x.to_a.last
# <a class="c-pagination__next c-pagination__link p-button" href="/reviews/archives/2">Next</a>
