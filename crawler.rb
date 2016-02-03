require_relative 'environment.rb'

browser = Capybara.current_session
# include Capybara::DSL

def print_link(dash_count, link)
  dashes = '-'* dash_count
  puts dashes + link
end

def page_links(browser)
  browser.all('a').map { |a| a[:href] }
end

parent = 'http://www.hardscrabble.net'
browser.visit parent
print_link(1, parent)
page_links(browser).each do |link|
  next unless link.include? parent
  print_link(2, link)
  browser.visit link
  page_links(browser).each do |sub_link|
    next unless sub_link.include? parent
    print_link(3, sub_link)
  end
end
