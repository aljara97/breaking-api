require 'json'
require 'rest-client'
require 'date'

class SearchController < ApplicationController
  def results
    @keyword = params[:keyword]
    search_keyword = @keyword.gsub(" ", "+")
    offset = 0
    status = 0
    @characters = []
    url = ""
    while status == 0 do
      if offset == 0
        url = "https://tarea-1-breaking-bad.herokuapp.com/api/characters?name=#{search_keyword}"
      else 
        url = "https://tarea-1-breaking-bad.herokuapp.com/api/characters?name=#{search_keyword}&limit=10&offset=#{offset}"
      end 
      response = RestClient.get url
      character_s = JSON.parse response.to_str
      offset += 10
      if character_s.length() > 0
        character_s.each do |chara|
          @characters.push(chara)
        end
      end
      if character_s.length() < 10
        status = 1
      end
    end
    puts @characters
  end
end