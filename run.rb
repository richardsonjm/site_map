require_relative 'lib/crawler.rb'

home_page = 'http://www.hardscrabble.net'
crawler = Crawler.new(home_page)
crawler.build_map(home_page, 1)
