class SearchesController < ApplicationController

  def index

    require 'nokogiri'
    require 'open-uri'

    # grab a user input from a form

    # scrape a page with nokogiri
    page = Nokogiri::HTML(open("http://sanfrancisco.gaycities.com/events/"))
    @events = page.css('div.event_icon')

    # you have to extract links text from each a element; output is an array
    @links = page.css('div.event_icon a').map {|link| link['href']}

  end

end
