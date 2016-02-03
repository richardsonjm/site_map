require_relative '../environment.rb'

class Crawler
  def initialize
    @browser = Capybara.current_session
  end

  def print_link(dash_count, link)
    dashes = '-'* dash_count
    puts dashes + link
  end

  def page_links
    @browser.all('a').map { |a| a[:href] }
  end

  def build_map(parent)
    @browser.visit parent
    print_link(1, parent)
    page_links.each do |link|
      next unless link.include? parent
      print_link(2, link)
      @browser.visit link
      page_links.each do |sub_link|
        next unless sub_link.include? parent
        print_link(3, sub_link)
      end
    end
  end
end
