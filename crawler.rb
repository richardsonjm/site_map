# Require the gems
require 'capybara/poltergeist'

# Configure Poltergeist to not blow up on websites with js errors aka every website with js
# See more options at https://github.com/teampoltergeist/poltergeist#customization
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

# Configure Capybara to use Poltergeist as the driver
Capybara.default_driver = :poltergeist


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
