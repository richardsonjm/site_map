require_relative 'lib/crawler.rb'

crawler = Crawler.new
crawler.build_map('http://www.hardscrabble.net')
