require_relative '../environment.rb'

class Crawler
  def initialize(home_page)
    @home_page = home_page
    @browser = Capybara.current_session
    @visited_links = []
  end

  def print_link(dash_count, link)
    dashes = '-'* dash_count
    puts dashes + link
  end

  def page_links
    @browser.all('a').map { |a| a[:href] }
  end

  def visit_link(link)
    @browser.visit link
    @visited_links << link
  end

  def build_map(dash_count, link=@home_page)
    # print home_page link only on first pass
    print_link(dash_count, link) if link == @home_page
    visit_link(link)
    dash_count += 1
    page_links.each do |link|
      # only print links within the home_page domain
      next unless link.include? @home_page
      print_link(dash_count, link)
      # only visit links if they have not been visited before
      next if @visited_links.include? link
      build_map(dash_count, link)
    end
  end
end
