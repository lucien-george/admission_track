require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def home
    if params[:movie].present?
      @movies = get_movies(params[:movie])
    else
      @movies = get_movies
      params[:movie] = "batman"
    end
  end

  private

  def get_movies(search = "batman")
    JSON.parse(open("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&query=#{search}").read)['results']
  end

end
