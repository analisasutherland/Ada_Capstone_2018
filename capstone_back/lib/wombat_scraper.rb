require 'wombat'
require 'pry'

class WombatScraper
  include Wombat::Crawler
  base_url 'https://www.polygon.com'

  # NOTE: Did a manual load of games by changing url before seeding and reseeding multiple times

  path '/reviews/archives'
  # article_index 'css=a.c-pagination__next.c-pagination__link', :follow do
  # This loop loops through all articles on a given index page ie page 1
  the_articles 'css=div.c-entry-box--compact__body h2 a', :follow do
    # Loops through a given article and pulls out all <p> tag content
    article 'css=div.c-entry-content', :iterator do |article|
      article.titles 'css=em', :list
      article.content 'css=p', :list
      article.image({ xpath: ".//img/@src" })
      # binding.pry
    end
  end
  # end
end
# new_scrape = WombatScraper.new.crawl
# p new_scrape.to_a


# <a class="c-pagination__next c-pagination__link p-button" href="/reviews/archives/2">Next</a>
