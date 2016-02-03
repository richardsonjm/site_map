require_relative 'lib/crawler.rb'

crawler = Crawler.new('http://www.hardscrabble.net')
crawler.build_map(1)
