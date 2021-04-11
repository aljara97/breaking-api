require 'json'
require 'rest-client'
require 'date'

class EpisodesController < ApplicationController

  # GET /episodes or /episodes.json
  def index
    #@episodes = Episode.all
  end

  # GET /episodes/1 or /episodes/1.json
  def show
    @id_ = params[:id]
    url = "https://tarea-1-breaking-bad.herokuapp.com/api/episodes/#{@id_}"
    response = RestClient.get url
    episode = JSON.parse response.to_str
    if episode.length() > 0
      @episode = episode[0]
      @characters = @episode['characters']
      @characters_list = []
      if @characters.length() > 0
        @characters.each do |character|
          name = character.gsub(" ", "+")
          puts name
          url_c = "https://tarea-1-breaking-bad.herokuapp.com/api/characters?name=#{name}"
          response_c = RestClient.get url_c
          character_s = JSON.parse response_c.to_str
          if character_s.length() > 0
            @characters_list.push(character_s[0])
          end
        end
        puts @characters_list
        puts "El largo de la lista es #{@characters_list.length()}"
      end

      date = Date.parse(@episode['air_date'])
      @emision = date.strftime("%a, %d %b %Y")


    end


  end

end
