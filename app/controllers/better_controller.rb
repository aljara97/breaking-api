class BetterController < ApplicationController
  def index
    url = "https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=Better+Call+Saul"
    response = RestClient.get url
    result = JSON.parse response.to_str
    mayor = 1
    result.each do |episode|
      puts episode['episode_id']
      if episode['season'].to_i > mayor
        mayor = episode['season'].to_i
      end
    end
    @mayor = mayor
    @seasons = (1..@mayor).to_a
    puts "la serie tiene #{@mayor} temporadas"
  end

  def show
    puts "buscas la temporada #{params[:id]} de Better Call Saul"
    @id_ = params[:id]
    @counter = 0
    url = "https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=Better+Call+Saul"
    response = RestClient.get url
    result = JSON.parse response.to_str
    @episodes = []
    if result.length() > 0
      result.each do |episode|
        if episode['season'] == @id_
          @episodes.push(episode)
          @counter += 1
        end
      end
    end
  end
end
