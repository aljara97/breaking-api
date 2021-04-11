require 'json'
require 'rest-client'

class CharactersController < ApplicationController

  def index
    #@characters = Character.all
  end

  def show
    @id_ = params[:id]
    url = "https://tarea-1-breaking-bad.herokuapp.com/api/characters/#{@id_}"
    response = RestClient.get url
    character = JSON.parse response.to_str
    if character.length() > 0
      @character = character[0]
      name = @character['name'].gsub(" ", "+")
      url_q = "https://tarea-1-breaking-bad.herokuapp.com/api/quote?author=#{name}"
      response_q = RestClient.get url_q
      @quotes = JSON.parse response_q.to_str
    end
  end

  
end
