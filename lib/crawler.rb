require_relative '../environment.rb'

class Crawler
  def initialize(home_page)
    @home_page = home_page
    print_link(home_page, 1)
    @browser = Capybara.current_session
    @visited_links = []
  end

  def print_link(link, dash_count)
    dashes = '-'* dash_count
    puts dashes + link
  end

  def page_links
    @browser.all('a').map { |a| a[:href] }
  end

  def build_map(link, dash_count)
    @browser.visit link
    @visited_links << link
    dash_count += 1
    page_links.each do |link|
      next unless link.include? @home_page
      print_link(link, dash_count)
      next if @visited_links.include? link
      build_map(link, dash_count)
    end
  end
end
